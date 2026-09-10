{self, inputs, ...}: {
    flake.nixosConfigurations.SH1T3RS = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            sh1t3rsConfiguration
            sh1t3rsDisk
            myHomeManager
            cpuAmd
            gpuAmd
            desktop
            development
            touchpad
        ];
    };
}
