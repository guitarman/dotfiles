# dotfiles
Personal dotfiles, configured to be used mostly with Linux and [Arch](https://archlinux.org)/[Manjaro](https://manjaro.org) distributions 
with [pacman](https://archlinux.org/pacman/) as package manager.

This repository contains several files for [i3-gaps](https://github.com/Airblader/i3), which is used as window tiling manager. To ensure all features and 
configurations will work properly, it is recommended to install these packages:

```
pacman -S ack blueman bluez bluez-utils brightnessctl feh git \
  i3lock i3-gaps polybar rofi xorg-xdpyinfo vim
```

Make sure you also install [pyenv](https://github.com/pyenv/pyenv) and [rbenv](https://github.com/rbenv/rbenv) with latest ruby and python versions respectively.
Recommended is also to setup [Base16 Shell](https://github.com/chriskempson/base16-shell) as most of the theme setup are relying on this.
