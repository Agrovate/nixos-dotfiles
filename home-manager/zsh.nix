{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cd = "z";
      ls = "eza -l";
      sysupdate = "sudo nixos-rebuild switch --flake .#snow";
    };
    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
    };
  };
  programs.starship.enable = true;
}
