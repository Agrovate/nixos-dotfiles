{self, inputs, ... }: {
   flake.nixosModules.niri = {pkgs, lib, ...}: {
       programs.niri = {
           enable = true;
           package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
       };
   };
    perSystem= {pkgs,lib,self', ...}: {
        packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
            inherit pkgs;
            settings = {
                spawn-at-startup = [
                    (lib.getExe self'.packages.myNoctalia)
                ];
                input.keyboard = {
                    xkb.layout = "us, ua";
                    xkb.options = "ctrl:swapcaps";
                };
                layout.gaps = 5;

                binds = {
                    "Mod+Shift+F".fullscreen-window = _: {};
                    "Mod+Return".spawn-sh = lib.getExe pkgs.ghostty;
                    "Mod+Q".close-window = _: {};
                    "Mod+E".quit = _: {};
                    "Mod+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";

                    "Mod+H".focus-column-left = _: {};
                    "Mod+L".focus-column-right = _: {};
                    "Mod+K".focus-window-or-workspace-up = _: {};
                    "Mod+J".focus-window-or-workspace-down = _: {};

                    "Mod+Shift+H".move-column-left = _: {};
                    "Mod+Shift+L".move-column-right = _: {};
                    "Mod+Shift+K".move-column-to-workspace-up = _: {};
                    "Mod+Shift+J".move-column-to-workspace-down = _: {};
                    "Mod+Shift+F3".spawn-sh = "${lib.getExe pkgs.grim} -g \"$(${lib.getExe pkgs.slurp})\" \"$HOME/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png\"";
                    "Mod+Shift+Slash".show-hotkey-overlay = _: {};
                };
            };
        };
    };
}
