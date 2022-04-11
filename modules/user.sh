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
usermod -aG sudo,audio,video,optical,storage $username
echo "Enable sudo group"
wait 5
visudo

