{self, inputs, ...}: {
    flake.nixosConfigurations.BACKPAIN = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            backpainConfiguration
            myHomeManager
            myMachineHardware
            cpuIntel
            gpuIntel
            desktop
            development
            touchpad
        ];
    };
}
