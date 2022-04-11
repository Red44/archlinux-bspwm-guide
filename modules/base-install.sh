#!/bin/bash
pacstrap /mnt base linux linux-firmware base-devel neovim wget git efibootmgr gzip sudo tree inetutils net-tools unzip vim nano
genfstab -U /mnt >> /mnt/etc/fstab
echo "Entering your new machine...."
arch-chroot /mnt