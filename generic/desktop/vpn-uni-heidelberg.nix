{ config, hostName, ... }:

# This configures a systemd service that starts the stupid university VPN
{
  #password and totp secret-token
  sops.secrets = {
    "openconnect/password".sopsFile = ../../secrets/openconnect.yaml;
    "openconnect/token-secret".sopsFile = ../../secrets/${hostName}/openconnect.yaml; #every host has different totp token
  };

  networking = {
    openconnect.interfaces."uni-heidelberg" = {
      autoStart = false;
      gateway = "https://vpnsrv2.urz.uni-heidelberg.de/"; #this seems to work better than https://vpn-ac.urz.uni-heidelberg.de for some reason
      protocol = "anyconnect";
      user = "me272";
      passwordFile = config.sops.secrets."openconnect/password".path;
      extraOptions = {
        useragent = "AnyConnect";
        token-mode = "totp";
        token-secret = "@${config.sops.secrets."openconnect/token-secret".path}";
      };
    };

    networkmanager.unmanaged = [ "uni-heidelberg" ];
  };

  #connecting to the university vpn fails sometimes for some reason. This will configure the systemd service to just try it 10 times in 5 sec intervals before the service is considered failed
  systemd.services."openconnect-uni-heidelberg" = {
    startLimitIntervalSec = 50;
    startLimitBurst = 10;
    serviceConfig = {
      Restart = "always";
      RestartSec = 5;
    };
  };
}