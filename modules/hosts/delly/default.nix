{self, inputs, ...}: {
    flake.nixosConfigurations.delly = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.myMachineConfiguration

            inputs.home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {inherit inputs;};
                home-manager.users.snow = ../../../home-manager/home.nix;
            }
        ];
    };
}
