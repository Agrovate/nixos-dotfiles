{self, inputs, ...}: {
    flake.nixosConfigurations.snow = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.myMachineConfiguration
            self.nixosModules.myHomeManager
        ];
    };
}
