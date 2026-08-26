{self,...}: {
    flake.nixosModules.core = {...}: {
        imports = with self.nixosModules; [
            boot
            locale
            users
            nixSettings
        ];
    };
}
