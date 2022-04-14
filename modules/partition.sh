#!/bin/bash

function ask_for_name() {
  echo "Enter your $1 partition"
  read partition_name
}
# create system parition
echo "Enter your disk you want to partition and create a system partition"
read -r operating_disk
fdisk "/dev/$operating_disk"

# format system parition
ask_for_name "system"
system_disk=$partition_name
mkfs.ext4 "/dev/$system_disk"

# mount & dir for further configurations
mount "/dev/$system_disk" "/mnt"
mkdir /mnt/install

read -p "EFI or bootloader/grub? 1(EFI) 2(bootloader)" boot
if [ $boot == "1" ]; then
  # wait so that the user must read the message and configure the EFI paritionw
  read -p "I recommend to use 550M for EFI partition (press enter to continue)" ignore
  fdisk "/dev/$operating_disk"
  # format EFI
  ask_for_name "EFI"
  efi_disk=$partition_name
  mkfs.fat -F32 "/dev/$efi_disk"
  # save parition name for further configuration
  touch "/mnt/install/efi"
  echo "$efi_disk" > "/mnt/install/efi"
  elif [ $boot == "2" ]; then 
  # save parition name for further configuration
   touch "/mnt/install/bootloader"
   echo "$system_disk" > "/mnt/install/bootloader"
fi
echo "Partitioning done!"
