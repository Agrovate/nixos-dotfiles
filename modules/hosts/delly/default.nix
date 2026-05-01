{self, inputs, ...}: {
    flake.nixosConfigurations.delly = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.myMachineConfiguration
        ];
    };
}
