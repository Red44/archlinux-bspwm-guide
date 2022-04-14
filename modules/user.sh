#!/bin/bash
echo "Set root password"
passwd
read -p "Enter your username : " username

if [ -z "$username" ]; then
  echo "Invalid username"
  exit
fi
useradd -m $username
echo "Set password for your user $username"
passwd $username
read -p "Enable wheel group (enter to continue)" ignore
visudo
usermod -aG wheel,audio,video,optical,storage $username


