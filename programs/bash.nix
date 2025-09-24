{ ... }:
{
  programs.bash = {
    enable = false;
    shellAliases = {
      btw = "echo I use nixos, btw";
    };
    initExtra = ''
      export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
    '';
  };
}
