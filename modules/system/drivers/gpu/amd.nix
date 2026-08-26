{ ... }: {
    flake.nixosModules.gpuAmd = { pkgs, ... }: {
        services.xserver.videoDrivers = [ "amdgpu" ];

        hardware.graphics = {
            enable = true;
            extraPackages = with pkgs; [
                amdvlk
            ];
        };

        environment.sessionVariables = {
            LIBVA_DRIVER_NAME = "radeonsi";
        };
    };
}
