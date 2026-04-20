
{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/hyprland.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  services.pipewire = {
   enable = true;
   pulse.enable = true;
 };

users.users.snow = {
  isNormalUser = true;
  extraGroups = ["wheel"];
};

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
      vim
      wget
      neovim
      git
   ];


  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  #networking.firewall.allowedTCPPorts = [22];

  nix.settings.experimental-features = ["nix-command" "flakes" ];
  system.stateVersion = "25.11"; # Did you read the comment?
}

