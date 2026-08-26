{pkgs,...}: {
  flake.nixosModules.brightness = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      brightnessctl
    ];
  };
}
