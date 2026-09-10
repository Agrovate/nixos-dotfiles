{self,...}: {
    flake.nixosModules.devices = {...}: {
        imports = with self.nixosModules; [
            bluetooth
            upower
            brightness
        ];
        services.qemuGuest.enable = true;
    };
}
