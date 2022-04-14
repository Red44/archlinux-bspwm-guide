#!/bin/bash
pacman -Sy grub efibootmgr dosfstools os-prober mtools
mkdir "/boot/EFI/"
disk=$(cat "/mnt/install/efi")
mount /dev/$disk /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
echo "Bootloader done"

