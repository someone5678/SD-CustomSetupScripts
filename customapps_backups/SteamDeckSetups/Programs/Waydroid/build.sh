#!/usr/bin/sh -x

CWD=$(pwd)

rm -Rf $CWD/src
rm -Rf $CWD/out
mkdir -p $CWD/src
mkdir -p $CWD/out

sudo pacman -Sy --noconfirm --asdeps --needed git dkms linux-neptune-headers
git clone https://aur.archlinux.org/anbox-modules-dkms-git.git $CWD/src/anbox-modules-dkms-git
# Patch PKGBUILD to comment out a sed that makes it fail to compile on the valve kernel
sed -i 's/\b\(sed\s\+.*#if\s\+1.*binder\.c\s*\)$/#\1/' $CWD/src/anbox-modules-dkms-git/PKGBUILD
sed -n 's/\b\(make\)\?depends=(\([^)]\+\))/\2/p' $CWD/src/anbox-modules-dkms-git/PKGBUILD | xargs -n 1 sudo pacman -S --noconfirm --asdeps --needed
cd $CWD/src/anbox-modules-dkms-git ; makepkg
git clone https://aur.archlinux.org/libglibutil.git $CWD/src/libglibutil
sed -n 's/\b\(make\)\?depends=(\([^)]\+\))/\2/p' $CWD/src/libglibutil/PKGBUILD | xargs -n 1 sudo pacman -S --noconfirm --asdeps --needed
cd $CWD/src/libglibutil ; makepkg
sudo pacman -U --noconfirm --needed --asdeps $CWD/src/libglibutil/*.pkg.tar.zst
git clone https://aur.archlinux.org/libgbinder.git $CWD/src/libgbinder
sed -n 's/\b\(make\)\?depends=(\([^)]\+\))/\2/p' $CWD/src/libgbinder/PKGBUILD | xargs -n 1 sudo pacman -S --noconfirm --asdeps --needed
cd $CWD/src/libgbinder ; makepkg
sudo pacman -U --noconfirm --needed --asdeps $CWD/src/libgbinder/*.pkg.tar.zst
git clone https://aur.archlinux.org/python-gbinder.git $CWD/src/python-gbinder
sed -n 's/\b\(make\)\?depends=(\([^)]\+\))/\2/p' $CWD/src/python-gbinder/PKGBUILD | xargs -n 1 sudo pacman -S --noconfirm --asdeps --needed
cd $CWD/src/python-gbinder ; makepkg
sudo pacman -U --noconfirm --needed --asdeps $CWD/src/python-gbinder/*.pkg.tar.zst
git clone https://aur.archlinux.org/waydroid.git $CWD/src/waydroid
sed -n 's/\b\(make\)\?depends=(\([^)]\+\))/\2/p' $CWD/src/waydroid/PKGBUILD | xargs -n 1 sudo pacman -S --noconfirm --asdeps --needed
cd $CWD/src/waydroid ; makepkg
git clone https://aur.archlinux.org/python-pyclip.git $CWD/src/python-pyclip
sed -n 's/\b\(make\)\?depends=(\([^)]\+\))/\2/p' $CWD/src/python-pyclip/PKGBUILD | xargs -n 1 sudo pacman -S --noconfirm --asdeps --needed
cd $CWD/src/python-pyclip ; makepkg
mv $CWD/src/anbox-modules-dkms-git/*.pkg.tar.zst $CWD/src/libglibutil/*.pkg.tar.zst $CWD/src/libgbinder/*.pkg.tar.zst $CWD/src/python-gbinder/*.pkg.tar.zst $CWD/src/python-pyclip/*.pkg.tar.zst $CWD/src/waydroid/*.pkg.tar.zst $CWD/out/
