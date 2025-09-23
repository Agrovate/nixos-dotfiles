{ pkgs, inputs, ... }:

let
  system = "x86_64-linux";
in
{
  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi-wayland
    hyprpaper
    devenv
    eza
    home-manager
    starship
    eww
    gh
    inputs.zen-browser.packages."${system}".default
  ];
}
