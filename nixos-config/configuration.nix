{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      /home/shana/programming/nix-project-defaults/nixos-config/configuration.nix
    ];

  boot = {
    blacklistedKernelModules = [ "snd_pcsp" ];
    kernelPackages = pkgs.linuxPackages_latest;
    cleanTmpDir = true;

    loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sdb";
    };
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/541a5fab-0935-4dd1-b54c-f7b43e4b0947";
    fsType = "ext4";
  };

  swapDevices =
    [ { device = "/dev/disk/by-label/lenalee-swap"; } ];

  networking = {
    defaultGateway = "192.168.1.254";
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
    consoleKeyMap = /home/shana/keymaps/dvp-1_2_1.map.gz;
    defaultLocale = "en_US.UTF-8";
  };

  # nVidia driver
  hardware.opengl.driSupport32Bit = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  services = {
    openssh.enable = true;

    postgresql = {
      enable = true;
      package = pkgs.postgresql96;
    };

    redshift = {
      enable = true;
      latitude = "51";
      longitude = "-2";
    };

    ntp.enable = true;

    cron.systemCronJobs = [
      "30 */1 * * * root nix-pull &>/dev/null http://hydra.nixos.org/jobset/nixpkgs/trunk/channel/latest/MANIFEST"
    ];

    # Enable the X11 windowing system.
    xserver = {
      videoDrivers = [ "nvidia" ];
      enable = true;
      layout = "us";

      xkbOptions = "compose:caps";
      xkbVariant = "dvp";

      windowManager.xmonad.enable = true;
      windowManager.xmonad.extraPackages = self: [ self.xmonad-contrib ];
      windowManager.default = "xmonad";
      desktopManager.default = "none";

      # xrandrHeads = [ "HDMI-0" "DVI-I-1" ];
      xrandrHeads = [
        { output = "DP-4"; primary = true; }
        { output = "HDMI-0"; }
      ];

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
        ${pkgs.xscreensaver}/bin/xscreensaver -no-splash &
        nitrogen --restore
      '';
    };
  };

  users.extraGroups.vboxusers.members = [ "shana" ];

  virtualisation.docker = {
    enable = true;
  };

  programs.ssh.startAgent = false;

  programs.bash.enableCompletion = true;

  # Don't blind me
  systemd.services.redshift.restartIfChanged = false;

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
    virtualbox.enableExtensionPack = true;
    firefox.enableGoogleTalkPlugin = true;
    firefox.icedtea = true;
    pulseaudio = true;
    # nvidia
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs;
    [ cacert
      cloc
      elfutils
      emacs
      file
      firefoxWrapper
      git
      glib
      glxinfo
      gnupg
      gnupg1
      gnutls
      htop
      mpv
      mupdf
      nitrogen
      nix-repl
      nmap
      openssl
      p7zip
      pavucontrol
      pinentry
      pythonPackages.youtube-dl
      rtorrent
      rxvt_unicode
      scrot
      sxiv
      thunderbird
      unzip
      wget
      xlibs.xsetroot
      xscreensaver
      xsel
      zip
       # work
      git-crypt
      kubernetes
      kubernetes-helm
      terraform
    ];

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

  nix = {
    trustedBinaryCaches = [
      "http://hydra.nixos.org"
      "http://cache.nixos.org"
    ];

    binaryCaches = [
      "http://hydra.nixos.org"
      "http://cache.nixos.org"
    ];
    binaryCachePublicKeys = [ "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs=" ];

    gc.automatic = false;

    extraOptions = ''
      allow-unsafe-native-code-during-evaluation = true
    '';
    maxJobs = pkgs.stdenv.lib.mkForce 6;
  };
}
