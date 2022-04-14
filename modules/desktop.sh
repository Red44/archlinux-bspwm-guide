#!/bin/bash
echo "This script must be executed by a user not root otherwise it is going to fail!"
user=$(whoami)
if [ $user == "root" ]; then
  echo "Root user is not allowed as well as sudo"
  exit
fi
cd /opt && sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $user:$user /opt/yay 
cd /opt/yay && makepkg -si
yay -Sy yay
sudo pacman -Syu archlinux-keyring
sudo pacman -Sy xorg xorg-xinit bspwm sxhkd rofi nitrogen picom arandr neofetch firefox-developer-edition mplayer base-devel clang jdk8-openjdk python-pip pulseaudio powerline qalculate-gtk ranger kleopatra kolourpaint gimp btop libreoffice-still mlocate rxvt-unicode rxvt-unicode-terminfo urxvt-perls teamspeak3 discord xsel
yay -Sy cava cbonsai downgrade fim polybar powerline-shell sublime-text-4 timeshift nerd-fonts-source-code-pro
home="/home/$user"
mkdir ~/tmp
cd ~/tmp/ && git clone https://github.com/Red44/archlinux-bspwm-guide/
mv ~/tmp/archlinux-bspwm-guide/config/ ~ -f
xrdb ~/.Xresources
echo "Wallpapers are in $home/.wallpapers"
nitrogen
sudo updatedb
echo "Done"
echo "Desktop shut start after login"
sleep 10
reboot
