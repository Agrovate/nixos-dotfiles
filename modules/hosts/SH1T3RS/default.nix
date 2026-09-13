{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.SH1T3RS = inputs.nixpkgs.lib.nixosSystem {
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
