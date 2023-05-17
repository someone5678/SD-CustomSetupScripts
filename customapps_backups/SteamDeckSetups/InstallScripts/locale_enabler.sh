#!/usr/bin/sh -x

# This script is enabling (uncommenting) the locales and regenerates them

#sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -S glibc --noconfirm
sudo sed -i "s%#ja_JP.UTF-8 UTF-8%ja_JP.UTF-8 UTF-8%" /etc/locale.gen
sudo sed -i "s%#ko_KR.UTF-8 UTF-8%ko_KR.UTF-8 UTF-8%" /etc/locale.gen
sudo locale-gen
#sudo steamos-readonly enable
# "Done! Be sure to put e.g. `LANG=ja_JP.UTF-8 %command%` in the game's startup options on Steam to enable the locale."
