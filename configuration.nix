{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "Asia/Kolkata";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.qtile.enable = true;
  };

  services.displayManager.ly.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nishant = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
  programs.zsh.enable = true;
  nix.settings.trusted-users = [ "root" "nishant" ];

  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };


  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    ghostty
    neofetch
    light
    krusader
    podman
    podman-compose
    acpi
    curl
    python3
    (python3.withPackages (python-pkgs: with python-pkgs; [
      pandas
      requests
    ]))
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

}

