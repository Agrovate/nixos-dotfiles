{ ... }:

{
  programs.git = {
    enable = true;
    userName = "agrovate";
    userEmail = "nishantullal@icloud.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}

