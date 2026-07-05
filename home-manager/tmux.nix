{config, pkgs, ... }:

{
  programs.tmux = {

    enable = true;
    terminal = "screen-256color";
    historyLimit = 10000;
    mouse = true;

    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;

    extraConfig = ''

    bind c new-window -c "#{pane_currnet_path}"

    unbind '"'
    unbind %
    bind | split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"

    '';

  };
}
