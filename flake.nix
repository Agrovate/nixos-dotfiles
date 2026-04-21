{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = {self, nixpkgs, home-manager, hyprland, ...} @ inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.mac-vm = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./hosts/mac-vm/configuration.nix
	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.snow = {
	    home.stateVersion = "25.11";
	  };
	}
      ];
    };

    nixosConfigurations.delly = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/delly/configuration.nix
	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.snow = {
        imports = [ ./modules/home/home.nix ];
	    home.stateVersion = "25.11";
	  };
	}
      ];
    };
  };
}
