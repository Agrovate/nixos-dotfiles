{ ... }:
{
  programs.nushell = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw";
      v = "nvim";
      ls = "eza";
      la = "eza -la";
      cd = "z";
      buildenv = "nix develop -c zsh -i";
    };
  };
}
