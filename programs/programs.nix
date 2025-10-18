{ pkgs, inputs, ... }:

let
  system = "x86_64-linux";
in
{
  home.packages = with pkgs; [
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
    zellij
    sioyek
    obsidian

    lua-language-server
    rust-analyzer

    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${system}".default
  ];
}
