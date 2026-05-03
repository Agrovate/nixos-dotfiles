{ config, pkgs, ... }:

{
  home.username = "snow";
  home.homeDirectory = "/home/snow";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    btop
    fastfetch
    unzip
    zip
    ripgrep
    fzf
  ];


  imports = [
    ./zsh.nix
    ./git.nix
    ./direnv.nix
  ];

  programs = {
    home-manager.enable = true;
    zoxide.enable = true;
    zoxide.enableZshIntegration = true;


  # 📂 Managing Dotfiles (Directly mapping files)
  # home.file.".config/my-app/config".text = ''
  #   setting = true
  # '';
  };
}
