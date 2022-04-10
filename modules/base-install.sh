#!/bin/bash
pacstrap /mnt base linux linux-firmware base-devil neovim wget git efibootmgr gzip sudo tree inetutils net-tools
genfstab -Z /mnt >> /mnt/etc/fstab
