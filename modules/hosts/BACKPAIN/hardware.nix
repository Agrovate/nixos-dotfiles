{self, inputs, ...}: {
    flake.nixosModules.myMachineHardware = { config, lib, pkgs, modulesPath, ... }:
        {
            imports =
                [ (modulesPath + "/installer/scan/not-detected.nix")
                ];

            boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
            boot.initrd.kernelModules = [ ];
            boot.kernelModules = [ "kvm-intel" ];
            boot.extraModulePackages = [ ];
            boot.loader.grub.extraEntries = ''
                    menuentry 'Arch Linux (on /dev/nvme0n1p3)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-33600e80-6042-4719-8b32-ab221bdc417a' {
                        insmod part_gpt
                        insmod ext2
                        search --no-floppy --fs-uuid --set=root 33600e80-6042-4719-8b32-ab221bdc417a
                        linux /boot/vmlinuz-linux root=UUID=33600e80-6042-4719-8b32-ab221bdc417a rw loglevel=3 quiet
                        initrd /boot/initramfs-linux.img
                    }
                '';

            fileSystems."/" =
                { device = "/dev/disk/by-uuid/c3d44ea9-1657-43b1-8676-9b408a4469cc";
                    fsType = "ext4";
                };

            fileSystems."/boot" =
                { device = "/dev/disk/by-uuid/72C3-DA26";
                    fsType = "vfat";
                    options = [ "fmask=0022" "dmask=0022" ];
                };

            swapDevices =
                [ { device = "/dev/disk/by-uuid/782bd487-446a-4fab-bce9-e7b1733bf935"; }
                ];

            nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
            hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

        };
}
