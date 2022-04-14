#!/bin/bash
pacman -Syu
pacman -Sy neofetch
function check_dir(){
  if ! [ -d "$1/$2" ] || [ -z "$2" ]; then
    echo "Invalid dir $2"
    exit
  fi
}

check_file(){
  if ! [ -e "$1/$2" ] || [ -z "$2" ]; then
    echo "Invalid file $2"
  fi
}
read -p "Enter your region : " region
check_dir "/usr/share/zoneinfo/" $region
read -p "Enter your city : " city
check_file "/usr/share/zoneinfo/$region/" $city
ln -sf "/usr/share/zoneinfo/$region/" $city /etc/localtime
hwclock --systohc
nvim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
