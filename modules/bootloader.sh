#!/bin/bash

disk=$(cat "/install/bootloader")
pacman -Sy grub
grub-install --force $disk
grub-mkconfig -o /boot/grub/grub.cfg
read -p "Bootloader applied on $disk (press enter to continue)"
