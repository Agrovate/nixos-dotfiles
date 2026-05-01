{self, inputs, ...}: {
    flake.homeModules.homeConfiguration = { config, pkgs, ... }: {

    home.username = "snow";
    home.homeDirectory = "/home/snow";

    home.stateVersion = "25.11";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      neovim
      git
      btop
      fastfetch
      ripgrep
      fzf
    ];
  };
}
