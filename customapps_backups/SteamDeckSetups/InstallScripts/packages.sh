#!/usr/bin/sh -x

sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo

sudo rm -Rf /etc/ld.so.conf.d/fakeroot.conf
sudo rm -Rf /etc/containers/registries.conf.d/00-shortnames.conf
sudo rm -Rf /etc/containers/registries.d/default.yaml
sudo rm -Rf /opt/visual-studio-code

sudo pacman -Sy paru fakeroot make gcc libadwaita xdelta3 --noconfirm
paru -Sy aria2 --noconfirm
paru -Sy visual-studio-code-bin --noconfirm
paru -Sy pnpm-bin npm --noconfirm
#paru -Sy yay --noconfirm
#paru -Sy easyeffects --noconfirm
