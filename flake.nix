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
  outputs = {self, nixpkgs, home-manager, hyprland, ...}:
  let
    system = "aarch64-linux";
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
  };
}
