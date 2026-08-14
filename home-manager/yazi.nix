{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    keymap = {
      manager.prepend_keymap = [
        { on = [ "v" ]; run = "visual_mode"; desc = "Enter Visual Mode"; }
        { on = [ "C-d" ]; run = "scroll 5"; desc = "Scroll Down"; }
        { on = [ "C-u" ]; run = "scroll -5"; desc = "Scroll Up"; }
        { on = [ "g" "g" ]; run = "arrow top"; desc = "Go to Top"; }
        { on = [ "G" ]; run = "arrow bottom"; desc = "Go to Bottom"; }
      ];
    };
    settings = {
      opener = {
        edit = [
          {
            run = "nvim \"$@\"";
            block = true;
            for = "unix";
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            name = "*";
            use = "edit";
          }
        ];
      };
      yazi = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };
    };
  };
}
