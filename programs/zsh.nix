{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw";
      v = "nvim";
      ls = "eza -la";
      cd = "z";
    };
    initContent = ''
      eval "$(starship init zsh)"
    '';
  };
}
