{config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "agrovate";
    userEmail = "nishantulal@icloud.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
