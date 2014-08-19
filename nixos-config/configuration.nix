{ config, pkgs, ... }:


let hydra = pkgs.fetchgit { url = https://github.com/NixOS/hydra.git;
                            rev = "69e3aa043893ca6abede95263d2da288b006e61a";
                            sha256 = "18e9f615dc58ae21d3ebb5298563017fb71cd6e7d101e48a9dfa63bb3e66d728";
                          };
in
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

  boot.kernelPackages = pkgs.linuxPackages_3_16;

  boot.cleanTmpDir = true;

  fileSystems."/mnt/mafuyu" = {
    device = "/dev/disk/by-label/mafuyu";
    fsType = "ext4";
  };

  fileSystems."/mnt/tomoyo" = {
    device = "/dev/disk/by-label/tomoyo";
    fsType = "ext4";
  };

  fileSystems."/mnt/kotomi" = {
    device = "/dev/disk/by-label/kotomi";
    fsType = "ext4";
  };

  fileSystems."/export/mafuyu" = {
    device = "/mnt/mafuyu";
    options = "bind";
  };

  fileSystems."/export/tomoyo" = {
    device = "/mnt/tomoyo";
    options = "bind";
  };

  fileSystems."/export/kotomi" = {
    device = "/mnt/kotomi";
    options = "bind";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/541a5fab-0935-4dd1-b54c-f7b43e4b0947";
    fsType = "ext4";
  };

  fileSystems."/mnt/yami" = {
    device = "yuuki:/yami";
    fsType = "nfs";
  };

  fileSystems."/mnt/mikan" = {
    device = "yuuki:/mikan";
    fsType = "nfs";
  };

  fileSystems."/mnt/hitagi" = {
    device = "yuuki:/hitagi";
    fsType = "nfs";
  };

  swapDevices =
    [ { device = "/dev/disk/by-label/lenalee-swap"; } ];

  networking = {
    defaultGateway = "192.168.1.254";
    extraHosts = "192.168.1.10 yuuki";
    firewall.enable = false;
    hostName = "lenalee";
    interfaces = {
      enp0s25 = { ipAddress = "192.168.1.11"; subnetMask = "255.255.255.0"; };
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
  nixpkgs.config.allowUnfree = true;
  hardware.opengl.driSupport32Bit = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.locate.enable = true;
  services.locate.period = "00 15 * * *";
  services.locate.extraFlags = [ "--netuser=shana"
                                 "--netpaths='/mnt/hitagi /mnt/mikan /mnt/yami'"
                               ];

  # Enable the X11 windowing system.
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    enable = true;
    layout = "us";

    xkbOptions = "compose:caps";
    xkbVariant = "dvp";

    windowManager.xmonad.enable = true;
    windowManager.xmonad.enableContribAndExtras = true;
    windowManager.default = "xmonad";
    desktopManager.default = "none";

    displayManager.slim.defaultUser = "shana";
    displayManager.slim.autoLogin = false;
    displayManager.slim.theme = "/home/shana/.slim-theme/slim-theme-r6.tar.gz";
  };

  services.xserver.startGnuPGAgent = true;
  programs.ssh.startAgent = false;

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xlibs.xmodmap}/bin/xmodmap -e "pointer = 3 2 1"
    ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name left_ptr
    nitrogen --restore
  '';

  services.redshift.enable = true;
  services.redshift.latitude = "51";
  services.redshift.longitude = "-2";

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

  nixpkgs.config.packageOverrides = self: rec {

    # Override Cantata expression to point at local checkout.
    cantataNixpkgs = self.cantata;
    cantata = pkgs.lib.overrideDerivation # Local SVN checkout
                 (cantataNixpkgs.override { withQt4 = false; withQt5 = true; })
                 (attrs: rec {
                    name = "cantata-1.3.54-r5185";
                    src = /home/shana/programming/cantata;
                    unpackPhase = "";
                    sourceRoot = "";
                 });
  };

  environment.systemPackages = with pkgs;
    [ (mpd.override { pulseaudioSupport = false; })
      (mpv.override { pulseSupport = false; })
      PPSSPP
      astyle
      cantata
      cloc
      dwb
      elfutils
      emacs
      file
      gdb
      gimp
      git
      gnome3.glade
      glib
      glxinfo
      gnupg
      gnupg1
      gnutls
      gtk3
      htop
      kde4.oxygen_icons
      lsof
      mcomix
      mupdf
      nitrogen
      nix-repl
      nmap
      pinentry
      python27Packages.livestreamer
      rtmpdump
      rtorrent
      rxvt_unicode
      screen
      scrot
      sshfsFuse
      tesseract
      thunderbird
      unzip
      wget
      xboxdrv
      xclip
      xcompmgr
      xfce.ristretto
      xlibs.xmodmap
      xlibs.xsetroot
      xsel
      youtubeDL
      zip
      zsh
      (haskellPackages.ghcWithPackages (self :
        [ self.xmonad
          self.xmonadContrib
          self.xmonadExtras
          self.cabal2nix
          self.HTTP
          self.tar
        ]))
    ];

  fonts = {
    enableFontConfig = true;
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
    "http://hydra.cryp.to"
    "http://yuuki:3000"
  ];

  nix.binaryCaches = [
    "http://hydra.nixos.org"
    "http://cache.nixos.org"
    "http://yuuki:3000"
  ];

  nix.gc.automatic = false;
  nix.gc.dates = "16:00";

  hardware.pulseaudio.enable = false;
  boot.blacklistedKernelModules = [ "snd_pcsp" ];

  services.udev.extraRules = ''
    ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0268", MODE:="0660", GROUP:="uinput"

    KERNEL=="event*",       NAME="input/%k", MODE:="660", GROUP="uinput"
    KERNEL=="js*",          NAME="input/%k", MODE:="664", GROUP="uinput"

    KERNEL=="uinput", MODE:="0660", GROUP="uinput"
  '';


  services.cron.systemCronJobs = [
      "30 */1 * * * root nix-pull &>/dev/null http://hydra.nixos.org/jobset/nixpkgs/trunk/channel/latest/MANIFEST"
      "20 */1 * * * root nix-pull &>/dev/null http://yuuki:3000/jobset/nixpkgs/trunk/channel/latest/MANIFEST"
      "40 */2 * * * root nix-pull &>/dev/null http://hydra.cryp.to/jobset/nixpkgs/haskell-updates/channel/latest/MANIFEST"
    ];

}
