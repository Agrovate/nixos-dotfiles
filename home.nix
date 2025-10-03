{ config, pkgs, inputs, nixvim, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    qtile = "qtile";
    nvim = "nvim";
    rofi = "rofi";
    hypr = "hypr";
    ghostty = "ghostty";
    hyprpaper = "hyprpaper";
    eww = "eww";
  };
  system = "x86_64-linux";
in
{
  home.username = "nishant";
  home.homeDirectory = "/home/nishant";
  home.stateVersion = "25.05";
  imports = [
    ./programs/git.nix
    ./programs/bash.nix
    ./programs/zoxide.nix
    ./programs/zsh.nix
    ./programs/tmux.nix
    ./programs/programs.nix
    inputs.nixvim.homeModules.nixvim
  ];

  #programs.nixvim.enable = true;


  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

}
