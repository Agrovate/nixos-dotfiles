{self, inputs, ...}: {
    flake.nixosConfigurations.BACKPAIN = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            backpainConfiguration
            backpainMachineHardware
            myHomeManager
            cpuIntel
            gpuIntel
            desktop
            development
            touchpad
        ];
    };
}
