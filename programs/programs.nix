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
    maven
    ant
    viu
    unzip
    slurp
    grim
    wl-clipboard
    alsa-utils

    lua-language-server
    rust-analyzer
    rocmPackages.llvm.clang-unwrapped

    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.zen-browser.packages."${system}".default
  ];
}
