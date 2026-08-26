{self, inputs, ...}: {
    flake.nixosConfigurations.snow = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            backpainConfiguration
            myHomeManager
            myMachineHardware
            cpuIntel
            gpuIntel
            desktop
            development
        ];
    };
}
