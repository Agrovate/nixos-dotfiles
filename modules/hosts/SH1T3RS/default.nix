{self, inputs, ...}: {
    flake.nixosConfigurations.SH1T3RS = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
            inputs.disko.nixosModules.disko
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
