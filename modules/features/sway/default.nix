{...}: {
    flake.nixosModules.swaybg = {config,lib, pkgs, ...}: {
        options.myWallpaper.image = lib.mkOption {
            type = lib.types.path;
            description = "Option to add wallpapers";
        };

        config = {
                systemd.user.services.swaybg = {
                    wantedBy = ["graphical-session.target"];
                    partOf = ["graphical-session.target"];
                    serviceConfig = {
                        ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${config.myWallpaper.image} -m fill";
                        Restart = "on-failure";
                    };
                };
            };
    };
}
