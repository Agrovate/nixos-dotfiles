{ self, inputs, ... }: {
  flake.homeConfigurations.USERNAME = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.snowModule
      {
        home.username = "snow";
        home.homeDirectory = "/home/snow";
      }
    ];
  };

  flake.homeModules.snowModule = { pkgs, ... }: {
    home.stateVersion = "25.11";

    home.packages = with pkgs; [
      btop
      fastfetch
      unzip
      zip
      ripgrep
      fzf
      bat
    ];


    imports = [
      ../../../home-manager/zsh.nix
      ../../../home-manager/git.nix
      ../../../home-manager/direnv.nix
    ];

    programs = {
      home-manager.enable = true;
      zoxide.enable = true;
      zoxide.enableZshIntegration = true;
    };
  };
}
