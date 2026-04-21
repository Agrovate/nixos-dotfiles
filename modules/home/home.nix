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

  programs = {
    home-manager.enable = true;

#    git = {
#      enable = true;
#      userName = "Your Name";
#      userEmail = "youremail@example.com";
#      extraConfig = {
#        init.defaultBranch = "main";
#      };
#    };

  # 📂 Managing Dotfiles (Directly mapping files)
  # home.file.".config/my-app/config".text = ''
  #   setting = true
  # '';
  };
}
