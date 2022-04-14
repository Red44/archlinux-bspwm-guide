#!/bin/bash
disk=$(cat "/install/grub")
pacman -Sy grub
grub-install --force $disk
grub-mkconfig -o /boot/grub/grub.cfg
