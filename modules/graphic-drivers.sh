#!/bin/bash
pacman -Sy wmname
echo "
export _JAVA_AWT_WM_NONREPARENTING=1
wmname LG3D
" >>/etc/profile

read -p "graphic-card-vendor 1(nvidia),2(amd),3(intel),4(vm)" vendor

if [ $vendor == "1" ]; then
  pacman -Sy nvidia nvidia-utils nvidia-settings
elif [ $vendor == "2" ]; then
  pacman -Sy xf86-video-amdgpu
elif [ $vendor == "3" ]; then
  pacman xf86-video-intel
elif [ $vendor == "4" ]; then
  pacman -Sy xf86-video-qxl
else
  echo "Invalid vendor type"
fi
