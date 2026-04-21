{ config, lib, pkgs,inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ../../modules/hyprland.nix
    ];


  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
      extraEntries = ''

menuentry 'Arch Linux (on /dev/nvme0n1p3)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-33600e80-6042-4719-8b32-ab221bdc417a' {
	insmod part_gpt
	insmod ext2
	search --no-floppy --fs-uuid --set=root 33600e80-6042-4719-8b32-ab221bdc417a
	linux /boot/vmlinuz-linux root=UUID=33600e80-6042-4719-8b32-ab221bdc417a rw loglevel=3 quiet
	initrd /boot/initramfs-linux.img
}
      '';
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;


  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";


  services.xserver.enable = false;


   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.starship.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

   environment.systemPackages = with pkgs; [
     vim
     wget
     git
     neovim
     ghostty
     wl-clipboard
     stow
     hyprpaper
     tofi
     zoxide
     eza
     gcc
   ];

  users.users.snow = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "isha";
    shell = pkgs.zsh;
  };
  
  
  services.displayManager.ly = {
    enable = true;
    settings = {
      path_session_log = "/home/snow/.local/state/ly-session.log";
    };
  };
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  nix.settings.experimental-features = ["nix-command" "flakes" ];
  system.stateVersion = "25.11";
}

