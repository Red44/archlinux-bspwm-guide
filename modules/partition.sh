#!/bin/bash

function ask_for_name() {
  echo "Enter your $1 partition"
  read partition_name
}

echo "Format the disk by yourself with fdisk create an EFI, System and Home partition. I recommend to use 550M for EFI"
lsblk
echo "Enter your disk you want to partition and create "
read -r operating_disk
fdisk "/dev/$operating_disk"

# Ask for partitions
ask_for_name "Home"
home_disk=$partition_name
ask_for_name "System"
system_disk=$partition_name
ask_for_name "EFI"
efi_disk=$partition_name

# Format partitions
mkfs.ext4 "/dev/$home_disk"
mkfs.ext4 "/dev/$system_disk"
mkfs.fat -F32 "/dev/$efi_disk"

# Mount to work with it
mount "/dev/$home_system_disk /mnt"

# Save collected data for futher use
mkdir /mnt/install
touch /mnt/install/efi
touch /mnt/install/home

echo "$efi_disk" > /mnt/install/efi
echo "$home_disk" > /mnt/install/home

echo "Partitioning done!"