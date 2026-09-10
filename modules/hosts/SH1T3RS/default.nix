{self, inputs, ...}: {
    flake.nixosConfigurations.SH1T3RS = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
            sh1t3rsConfiguration
            sh1t3rsMachineHardware
            myHomeManager
            cpuAmd
            gpuAmd
            desktop
	    gaming
            development
            touchpad
        ];
    };
}
