{self, inputs, ...}: {
    flake.nixosModules.myMachineHardware = { config, lib, pkgs, modulesPath, ... }:
        {
            boot.loader.grub.extraEntries = ''
                    menuentry 'Arch Linux (on /dev/nvme0n1p3)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-33600e80-6042-4719-8b32-ab221bdc417a' {
                            insmod part_gpt
                        insmod ext2
                        search --no-floppy --fs-uuid --set=root 33600e80-6042-4719-8b32-ab221bdc417a
                        linux /boot/vmlinuz-linux root=UUID=33600e80-6042-4719-8b32-ab221bdc417a rw loglevel=3 quiet
                        initrd /boot/initramfs-linux.img
                    }
                '';
        };
}
