# archlinux-bspwm-guide
A guide to install archlinux with bspwm

Arch install

timedatectl set-ntp true //set time
fdisk make your partions 
(EFI 550M)
(SWAP 50% MEM)
(HOME 250G)
(SYSTEM 750G)
...
create filesystems
mkfs.ext4
mkfs.fat -F32
mkswap

swapon /dev/sdX //set swap

pacstrap into system partition

mount /dev/sdX /mnt
pacstrap /mnt linux base linux-firmware base-devel neovim wget git arandr bspwm cronie discord_arch_electron firefox-developer-edition jetbrains-toolbox kleopatra neofetch nitrogen nvidia nvidia-settings nvidia-utils polybar postman-bin powerline powerline-shell picom pulseaudio ranger rofi rxvt-unicode streamdeck-ui-git sublime-text-4 sudo sxhkd teamspeak3 termius timeshift tree unzip unrar usbutils wmname xorg xorg-xinit  yay //for vm xf86-video-qxl
genfstab -U /mnt >> /mnt/etc/fstap
//enter system 
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/REGION/CITY /etc/localtime
hwclock --systohc //sets the hardware clock
nvim /etc/locale.gen (en_US.UTF8)
locale-gen //update local files
nvim /etc/hostname //enter hostname in the first line
nvim /etc/hosts
127.0.0.1			localhost
::1 				localhost
127.0.0.1 			myhostname.localdomain myhostname
nvim /etc/vconsole.conf (KEYMAP=de-latin1) // for permanent keyboard layout
passwd
useradd -m username
passwd username
usermod -aG sudo,audio,video,optical,storage username
visudo (enable sudo group)
