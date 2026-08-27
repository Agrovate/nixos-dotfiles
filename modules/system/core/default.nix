{self,...}: {
    flake.nixosModules.core = {pkgs,lib,...}: let
        modules = with self.nixosModules; [
            boot
            locale
            users
            nixSettings
        ];
    in {
        imports = [
            /etc/nixos/hardware-configuration.nix
        ]
        ++ modules;
    };
}
