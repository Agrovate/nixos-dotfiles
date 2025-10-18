{ ... }:
{
  programs.tmux = {
    enable = true;
    historyLimit = 100000;
    prefix = "C-a";
    baseIndex = 1;
    #   shell = "${pkgs.zsh}/bin/zsh";
    #   mouse = true;
    keyMode = "vi";
    #   escapeTime = 10;
  };
}
