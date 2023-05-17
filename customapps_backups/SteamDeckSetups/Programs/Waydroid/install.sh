#!/bin/bash

sudo systemctl stop waydroid-container.service
wait

sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
sudo pacman -Sy --noconfirm --needed linux-neptune-headers libappindicator-gtk3
#sudo pacman -U --noconfirm ./out/binder_linux-dkms/*.pkg.tar.zst
rm -Rf ./out/anbox-modules-dkms-git*
sudo pacman -U --noconfirm --asdeps ./out/*.pkg.tar.zst
sudo pacman -D --asexplicit waydroid

#xargs -a /usr/lib/modules-load.d/anbox-modules.conf -n 1 sudo modprobe

sudo cp -a /usr/lib/systemd/system/var-lib-docker.mount /etc/systemd/system/var-lib-waydroid.mount
sudo sed -i 's|/var/lib/docker|/var/lib/waydroid|g' /etc/systemd/system/var-lib-waydroid.mount
sudo systemctl daemon-reload
sudo systemctl enable --now var-lib-waydroid.mount

sudo mount /dev/disk/by-partsets/self/efi /mnt
sudo sed -i 's/\b\(steamenv_boot\s\+.*\)$/\1 psi=1/g' /mnt/EFI/steamos/grub.cfg
sudo umount /mnt

sudo waydroid init -s GAPPS -f

sudo pacman -S --noconfirm python-pip
sudo pip install tqdm requests
sudo python ./waydroid_script/main.py -l

sudo systemctl start waydroid-container.service &
wait

sudo chmod g+w,o+w /var/lib/waydroid
