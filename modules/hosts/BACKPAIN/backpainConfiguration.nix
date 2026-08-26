{self, inputs, ...}: {
    flake.nixosModules.backpainConfiguration = {pkgs, lib, ...}: {

        networking.hostName = "BACKPAIN";

        xdg.portal.enable= true;
        xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
        programs.nix-ld.enable = true;


        environment.systemPackages = with pkgs; [
            alacritty

            inputs.zen-browser.packages.x86_64-linux.default
            inputs.swiss.packages.x86_64-linux.default
            inputs.project-maxxer.packages.x86_64-linux.default

            nautilus
        ];
    };
}
