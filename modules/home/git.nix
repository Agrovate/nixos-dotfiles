{config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "agrovate";
        email = "nishantulal@icloud.com";
      };
      init.defaultBranch = "main";
    };
  };
}
