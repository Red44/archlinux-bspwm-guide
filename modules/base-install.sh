#!/bin/bash
pacstrap /mnt base linux linux-firmware base-devil neovim wget git efibootmgr gzip sudo tree inetutils net-tools base-devel unzip vim nano
genfstab -Z /mnt >> /mnt/etc/fstab
wait 5
echo "Entering your new machine...."
arch-chroot /mnt