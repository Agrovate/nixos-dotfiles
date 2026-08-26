{self,pkgs,...}: {
    flake.nixosModules.development = {pkgs,...}: {
        imports = with self.nixosModules; [
            direnv
            git
            tmux
            ghostty
        ];
        environment.systemPackages = with pkgs; [
            devenv
            claude-code
            direnv
            wget
            wl-clipboard
            stow
            man-pages
            man-pages-posix
            neovim
            obsidian
        ];
    };
}
