{ self,inputs,...}: {
  flake.nixosModules.users = { pkgs,lib,...}: {
    imports = with self.nixosModules; [ zsh ];
    users.users.snow = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "root" "wheel" ];
    };
    home-manager.users.snow = self.homeModules.snowModule;
  };
}

