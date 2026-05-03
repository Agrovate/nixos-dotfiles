{config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "agrovate";
      user.email = "nishantulal@icloud.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
