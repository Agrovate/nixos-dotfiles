{self,...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = with self.nixosModules; [
      core
      network
      audio
      devices
      quickshell
      niri
      greetd
      fonts
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
