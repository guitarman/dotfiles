#!/bin/sh
xrandr --output HDMI-2 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output eDP-1 --off --output DP-2 --off

sed -i 's/Xft\.dpi: 120/Xft\.dpi: 92/g' ~/.Xresources
xrdb ~/.Xresources
i3 restart
