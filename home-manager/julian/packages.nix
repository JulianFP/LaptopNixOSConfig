{ config, pkgs, ... }:

{
  #Activates ability to install fonts through home-manager
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Hyprland additions, desktop stuff
    wl-clipboard
    cliphist
    playerctl
    brightnessctl
    pulseaudio
    pavucontrol
    networkmanagerapplet
    libsForQt5.polkit-kde-agent
    libsForQt5.kwalletmanager
    libsForQt5.kwallet
    swaylock
    sway-contrib.grimshot
    gnome.adwaita-icon-theme

    # CLI Applications
    tree
    unzip
    htop-vim
    s-tui

    # Applications
    firefox
    thunderbird
    libreoffice-fresh
    xournalpp
    logseq
    keepassxc
    nextcloud-client
    signal-desktop
    webcord
    libsForQt5.ark
    libsForQt5.dolphin
    libsForQt5.filelight
    libsForQt5.okular

    # Multimedia
    libsForQt5.gwenview
    libsForQt5.kimageformats
    libsForQt5.qt5.qtimageformats
    mpv
    vlc

    # Gaming
    wineWowPackages.stagingFull
    winetricks
    gamescope
    gamemode
    steam
    lutris
    heroic

    # Development
    texlive.combined.scheme-full
    gcc
    cmake
    gnumake
    valgrind

    # Fonts
    roboto-mono
    font-awesome
    nerdfonts
  ];
}
