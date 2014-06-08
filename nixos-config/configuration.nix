{ config, pkgs, ... }:

{
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

  services.xserver.videoDrivers = [ "nvidia" ];

  fileSystems."/mnt/mafuyu" = {
    device = "/dev/disk/by-label/mafuyu";
    fsType = "ext4";
  };

  fileSystems."/mnt/sen" = {
    device = "/dev/disk/by-label/sen";
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

  fileSystems."/export/sen" = {
    device = "/mnt/sen";
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

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/541a5fab-0935-4dd1-b54c-f7b43e4b0947";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/lenalee-swap"; } ];


  networking.hostName = "lenalee";
  networking.firewall.enable = false;


  # Select internationalisation properties.
  i18n = {
    # consoleFont = "lat9w-16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_US.UTF-8";
  };

  # nVidia driver
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.vaapiDrivers = [ pkgs.vaapiIntel ];
  services.xserver.layout = "us";

  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver.xkbVariant = "dvorak";

  # Enable the KDE Desktop Environment.
  services.xserver.desktopManager.kde4.enable = true;
  services.xserver.displayManager.kdm.enable = true;

  # NFS
  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export                 192.168.1.10(rw,fsid=0,no_subtree_check) 192.168.1.15(rw,fsid=0,no_subtree_check)
    /export/kotomi          192.168.1.10(rw,nohide,insecure,no_subtree_check) 192.168.1.15(rw,nohide,insecure,no_subtree_check)
    /export/mafuyu          192.168.1.10(rw,nohide,insecure,no_subtree_check) 192.168.1.15(rw,nohide,insecure,no_subtree_check)
    /export/sen             192.168.1.10(rw,nohide,insecure,no_subtree_check) 192.168.1.15(rw,nohide,insecure,no_subtree_check)
    /export/tomoyo          192.168.1.10(rw,nohide,insecure,no_subtree_check) 192.168.1.15(rw,nohide,insecure,no_subtree_check)
  '';

  services.nfs.server.createMountPoints = true;

  # Users
  users.extraUsers.shana = {
    createHome = true;
    home = "/home/shana";
    description = "Mateusz Kowalczyk";
    extraGroups = [ "wheel" "audio" "video" ];
    useDefaultShell = true;
  };

  nixpkgs.system = "x86_64-linux";

  #services.xserver.windowManager.xmonad.enable = true;

  environment.systemPackages =
    [ pkgs.firefox
      pkgs.thunderbird
      (pkgs.emacs.override { gtk = pkgs.gtk3; })
      pkgs.elfutils
      pkgs.file
      pkgs.git
      pkgs.gnupg
      pkgs.htop
      (pkgs.mpv.override { pulseSupport = true; })
      pkgs.redshift
      pkgs.sudo
      pkgs.wget
      pkgs.xsel
      pkgs.zsh
      pkgs.unetbootin
      pkgs.gtk3
      pkgs.glib
      #pkgs.gsettings-desktop-schemas
      pkgs.uzbl
      pkgs.mumble
      pkgs.scrot
      pkgs.screen
      pkgs.mpd
      # pkgs.sshfs-fuse
      # pkgs.nitrogen
      # pkgs.ghc
      # pkgs.haskell-xmonad-ghc7.6.3
      # pkgs.haskell-xmonad-contrib-ghc7.6.3-0.12-profiling
    ];

  nix.trustedBinaryCaches = [ "http://hydra.nixos.org" "http://cache.nixos.org" ];
  nix.gc.automatic = true;
  nix.gc.dates = "16:00";

  hardware.pulseaudio.enable = true;
  boot.blacklistedKernelModules = [ "snd_pcsp" ];

  services.udev.extraRules = ''
    ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0268", MODE:="0660", GROUP:="uinput"

    KERNEL=="event*",       NAME="input/%k", MODE:="660", GROUP="uinput"
    KERNEL=="js*",          NAME="input/%k", MODE:="664", GROUP="uinput"

    KERNEL=="uinput", MODE:="0660", GROUP="uinput"
  '';
}
