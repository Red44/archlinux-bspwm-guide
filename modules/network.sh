#!/bin/bash
read -p "Enter your hostname : " hostname
touch /etc/hostname
touch /etc/hosts
echo "$hostname" > "/etc/hostname"
echo "
127.0.0.1     localhost
::1           localhost
127.0.1.1   $hostname.localdomain $hostname
" >> "/etc/hostname"

touch  /etc/systemd/network/20-wired.network
echo "
[Match]
Name=enp*

[Network]
DHCP=yes
DNS=1.1.1.1
" >  /etc/systemd/network/20-wired.network


