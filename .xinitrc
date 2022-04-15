#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
#exec i3 &>> "/var/log/i3.log"
export XDG_SESSION_TYPE=x11
# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
loadkeys de-latin1.map.gz &
picom -f &
xsetroot -cursor_name left_ptr &
nitrogen --restore &
bash "$HOME/.config/polybar/launch.sh &"
urxvtd -q -o -f &
exec bspwm
