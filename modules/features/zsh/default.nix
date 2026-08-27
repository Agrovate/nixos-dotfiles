{self, inputs, ...}: {
    flake.nixosModules.zsh = {pkgs, lib, ...}: {
        nixpkgs.overlays = [
            (final: prev: {
                zsh = self.packages.${pkgs.stdenv.hostPlatform.system}.myZsh;
            })
        ];
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            enableBashCompletion = true;
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;
            histSize = 10000;
        };
        users.defaultUserShell = pkgs.zsh;
        programs.starship.enable = true;
        programs.zoxide.enable = true;
        programs.zoxide.enableZshIntegration = true;
    };

    perSystem = {pkgs, lib, ...}: {
        packages.myZsh = inputs.wrapper-modules.wrappers.zsh.wrap {
            inherit pkgs;
            zshAliases = {
                cd = "z";
                ls = "${lib.getExe pkgs.eza} -l";
                sysupdate = "sudo nixos-rebuild switch --impure --flake /home/snow/nixos-dotfiles";
            };
            zshrc.content = ''
                HISTFILE="$HOME/.zsh_history"
                setopt HIST_IGNORE_ALL_DUPS
            '';
        };
    };
}
