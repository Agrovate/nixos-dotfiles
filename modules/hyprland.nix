{config, pkgs, ...}:
{
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    waybar
    wofi
    kitty
    hyprpaper
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
}
