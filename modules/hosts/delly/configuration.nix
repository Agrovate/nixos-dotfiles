{self, inputs, ...}: {
    flake.nixosModules.myMachineConfiguration = {pkgs, lib, ...}: {
        imports = [
            self.nixosModules.myMachineHardware
            self.nixosModules.niri
            self.nixosModules.tmux
        ];


        boot.loader = {
            grub = {
                enable = true;
                efiSupport = true;
                device = "nodev";
                useOSProber = false;
                extraEntries = ''

    menuentry 'Arch Linux (on /dev/nvme0n1p3)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-33600e80-6042-4719-8b32-ab221bdc417a' {
        insmod part_gpt
        insmod ext2
        search --no-floppy --fs-uuid --set=root 33600e80-6042-4719-8b32-ab221bdc417a
        linux /boot/vmlinuz-linux root=UUID=33600e80-6042-4719-8b32-ab221bdc417a rw loglevel=3 quiet
        initrd /boot/initramfs-linux.img
    }
                '';
            };
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot";
            };
        };

        boot.kernelPackages = pkgs.linuxPackages_latest;

        services.dbus.enable = true;
        xdg.portal.enable= true;
        xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];


        networking.networkmanager.enable = true;

        time.timeZone = "Asia/Kolkata";


        services.xserver.enable = false;


        services.pipewire = {
            enable = true;
            pulse.enable = true;
        };

       hardware.bluetooth = {
            enable = true;
            powerOnBoot = true;
            settings = {
                General = {
                    Experimental = true;
                };
            };
        };

        programs.firefox.enable = true;
        programs.zsh.enable = true;
        programs.starship.enable = true;


        programs.direnv = {
            enable = true;
            nix-direnv.enable = true;
            enableZshIntegration = true;
            settings = {
                global = {
                    hide_env_diff = true;
                };
            };
        };

        environment.systemPackages = with pkgs; [
            vim
            wget
            git
            neovim
            ghostty
            wl-clipboard
            stow
            hyprpaper
            tofi
            zoxide
            eza
            gcc
        ];

        users.users.snow = {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
            initialPassword = "isha";
            shell = pkgs.zsh;
        };
        home-manager.users.snow = self.homeModules.snowModule;

        services.greetd = {
            enable = true;
            settings = {
                default_session = {
                    command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
                    user = "greeter";
                };
            };
        };
        systemd.services.greetd.serviceConfig = {
            Type = "idle";
            StandardInput = "tty";
            StandardOutput = "null";
            StandardError = "journal";
            TTYReset = true;
            TTYVHangup = true;
            TTYVTDisallocate = true;
        };

        services.openssh = {
            enable= true;
        };

        nix.settings.experimental-features = ["nix-command" "flakes" ];
        system.stateVersion = "25.11";
    };
}
