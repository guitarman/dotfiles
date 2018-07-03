#!/bin/sh
sed -i 's/Xft\.dpi: 120/Xft\.dpi: 92/g' ~/.Xresources
xrdb ~/.Xresources
i3 restart

xrandr --output HDMI-2 --mode 1920x1080 --pos 2560x176 --rotate normal --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2 --off
