{
  description = "Nixos from scratch";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
  };
  outputs = { self, nixpkgs, home-manager, zen-browser, nvf, ... } @inputs: {

    packages."x86_64-linux".default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./nvf-configuration.nix ];
      }).neovim;

    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.nishant = import ./home.nix;
            backupFileExtension = "backup";
          };
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
        }
      ];
    };
  };
}
