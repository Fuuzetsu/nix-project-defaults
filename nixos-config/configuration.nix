{ config, pkgs, ... }:

rec {
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      /home/shana/programming/nix-project-defaults/nixos-config/configuration.nix
    ];


  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sdb";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.cleanTmpDir = true;

  # fileSystems."/mnt/mafuyu" = {
  #   device = "/dev/disk/by-label/mafuyu";
  #   fsType = "ext4";
  # };

  # fileSystems."/mnt/tomoyo" = {
  #   device = "/dev/disk/by-label/tomoyo";
  #   fsType = "ext4";
  # };

  # fileSystems."/mnt/kotomi" = {
  #   device = "/dev/disk/by-label/kotomi";
  #   fsType = "ext4";
  # };

  # fileSystems."/export/mafuyu" = {
  #   device = "/mnt/mafuyu";
  #   options = "bind";
  # };

  # fileSystems."/export/tomoyo" = {
  #   device = "/mnt/tomoyo";
  #   options = "bind";
  # };

  # fileSystems."/export/kotomi" = {
  #   device = "/mnt/kotomi";
  #   options = "bind";
  # };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/541a5fab-0935-4dd1-b54c-f7b43e4b0947";
    fsType = "ext4";
  };

  /*
  fileSystems."/mnt/yami" = {
    device = "yuuki:/yami";
    fsType = "nfs";
  };
  */
  # fileSystems."/mnt/mikan" = {
  #   device = "yuuki:/mikan";
  #   fsType = "nfs";
  # };

  # fileSystems."/mnt/hitagi" = {
  #   device = "yuuki:/hitagi";
  #   fsType = "nfs";
  # };


  swapDevices =
    [ { device = "/dev/disk/by-label/lenalee-swap"; } ];

  networking = {
    defaultGateway = "192.168.1.254";
    extraHosts = ''
      192.168.1.10 yuuki
    '';
    firewall.enable = false;
    hostName = "lenalee";
    interfaces = {
      enp0s31f6 = { ipAddress = "192.168.1.11"; prefixLength = 24; };
    };
    nameservers = [ "192.168.1.254" ];
    useDHCP = false;
  };

  # Select internationalisation properties.
  i18n = {
    consoleKeyMap = "/home/shana/keymaps/dvp-1_2_1.map.gz";
    defaultLocale = "en_US.UTF-8";
  };

  # nVidia driver

  hardware.opengl.driSupport32Bit = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.locate.enable = true;
  services.locate.period = "00 15 * * *";
  services.locate.extraFlags = [ "--netuser=shana"
                                 "--netpaths='/mnt/hitagi /mnt/mikan /mnt/yami'"
                               ];

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql92;
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableHardening = false;

  users.extraGroups.vboxusers.members = [ "shana" ];

  virtualisation.docker = {
    enable = true;
    extraOptions = "-H 0.0.0.0:5555 -H unix:///var/run/docker.sock";
    storageDriver = "devicemapper";
    postStart = ''
      while ! [ -e /var/run/docker.pid ]; do
        sleep 0.1
      done
    '';
  };

  # Enable the X11 windowing system.
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    enable = true;
    layout = "us";

    xkbOptions = "compose:caps";
    xkbVariant = "dvp";

    startGnuPGAgent = true;

    windowManager.xmonad.enable = true;
    windowManager.xmonad.extraPackages = self: [ self.xmonad-contrib ];
    windowManager.default = "xmonad";
    desktopManager.default = "none";

    xrandrHeads = [ "HDMI-0" "DVI-I-1" ];

    inputClassSections =
      let s =
        ''
          Identifier "MouseOptions"
            MatchIsPointer "on"
            Option "ButtonMapping" "3 2 1"
        '';
      in [s];

    displayManager.lightdm = {
      enable = true;
      extraSeatDefaults = ''
        greeter-show-manual-login=true
        greeter-hide-users=true
        allow-guest=false
      '';
    };

    displayManager.sessionCommands = ''
      ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name left_ptr
      nitrogen --restore
      ${pkgs.xscreensaver}/bin/xscreensaver -no-splash &
    '';

  };

  programs.ssh.startAgent = false;

  services.redshift = {
    enable = true;
    latitude = "51";
    longitude = "-2";
  };

  # Don't blind me
  systemd.services.redshift.restartIfChanged = false;

  # NFS
  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export                 192.168.1.10(rw,fsid=0,no_subtree_check)
    /export/kotomi          192.168.1.10(rw,nohide,insecure,no_subtree_check)
    /export/mafuyu          192.168.1.10(rw,nohide,insecure,no_subtree_check)
    /export/sen             192.168.1.10(rw,nohide,insecure,no_subtree_check)
    /export/tomoyo          192.168.1.10(rw,nohide,insecure,no_subtree_check)
  '';

  services.nfs.server.createMountPoints = true;

  services.ntp.enable = true;
  time.timeZone = "Europe/London";

  # Users
  users.extraUsers.shana = {
    createHome = true;
    home = "/home/shana";
    description = "Mateusz Kowalczyk";
    extraGroups = [ "wheel" "audio" "video" ];
    useDefaultShell = true;
  };




  nixpkgs.system = "x86_64-linux";

  nixpkgs.config = {
    packageOverrides = self: rec {

      # Override Cantata expression to point at local checkout.
      cantata = pkgs.lib.overrideDerivation # Local SVN checkout
                   (self.cantata.override { withQt4 = false;
                                            withQt5 = true;
                                          })
                   (attrs: rec {
                      name = "cantata-git";
                      src = pkgs.fetchgitLocal /home/shana/programming/cantata;
                      unpackPhase = "";
                      sourceRoot = "";
                   });

      emacsEnv = pkgs.buildEnv {
        name = "emacs-env";
        paths = [ /*pkgs.haskellPackages.Agda*/ pkgs.emacs ];
      };
    };

    virtualbox.enableExtensionPack = true;

    firefox.enableGoogleTalkPlugin = true;
    firefox.icedtea = true;


    pulseaudio = true;

    # nvidia
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs;
    [ astyle
      #cantata
      cacert
      cloc
      elfutils
      emacsEnv
      file
      firefoxWrapper
      gdb
      #gimp
      git
      glib
      glxinfo
      gnome3.glade
      gnupg
      gnupg1
      gnutls
      gtk3
      htop
      kde4.oxygen_icons
      lsof
      mcomix
      mpd
      mpv
      mumble
      mupdf
      nitrogen
      nix-repl
      nmap
      openjdk
      openssl
      p7zip
      pavucontrol
      pinentry
      python27Packages.livestreamer
      pythonPackages.youtube-dl
      rtmpdump
      rtorrent
      rxvt_unicode
      screen
      scrot
      sshfsFuse
      sxiv
      tesseract
      thunderbird
      unzip
      vagrant
      wget
      xboxdrv
      xclip
      xlibs.xsetroot
      xscreensaver
      xsel
      zip
      zsh
    ];


  security.setuidPrograms = [ "ncsvc" ];

  fonts = {
    fontconfig.enable = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      inconsolata
      source-han-sans-japanese
      source-han-sans-korean
      source-han-sans-simplified-chinese
      source-han-sans-traditional-chinese
      ubuntu_font_family
    ];
  };

  security.sudo.enable = true;

  nix.trustedBinaryCaches = [
    "http://hydra.nixos.org"
    "http://cache.nixos.org"
    "http://yuuki:3000"
    "http://hydra.cryp.to"
  ];

  nix.binaryCaches = [
    "http://hydra.nixos.org"
    "http://cache.nixos.org"
    #"http://yuuki:3000"
  ];
  nix.binaryCachePublicKeys = [ "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs=" ];

  nix.gc.automatic = false;
  nix.gc.dates = "16:00";

  nix.extraOptions = ''
    allow-unsafe-native-code-during-evaluation = true
  '';
  nix.maxJobs = pkgs.stdenv.lib.mkForce 6;

  hardware.pulseaudio.enable = true;
  boot.blacklistedKernelModules = [ "snd_pcsp" ];

  services.udev.extraRules = ''
    ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0268", MODE:="0660", GROUP:="uinput"

    KERNEL=="event*",       NAME="input/%k", MODE:="660", GROUP="uinput"
    KERNEL=="js*",          NAME="input/%k", MODE:="664", GROUP="uinput"

    KERNEL=="uinput", MODE:="0660", GROUP="uinput"
  '';


  services.cron.systemCronJobs = [
      "30 */1 * * * root nix-pull &>/dev/null http://hydra.nixos.org/jobset/nixpkgs/trunk/channel/latest/MANIFEST"
      #"20 */1 * * * root nix-pull &>/dev/null http://yuuki:3000/jobset/nixpkgs/trunk/channel/latest/MANIFEST"
    ];

}
