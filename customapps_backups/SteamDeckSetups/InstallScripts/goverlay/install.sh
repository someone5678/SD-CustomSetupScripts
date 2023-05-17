#!/usr/bin/sh -x
#
# vkbasalt_install.sh
#
# Author: Chris Simons <chris@simonsmail.net>
# Platform: Steam Deck SteamOS
#
# Description: Installs vkBasalt on a Steam Deck in the deck home
# directory without modifying the immutable OS filesystem.
#
# modified by someone5678

set -eo pipefail

if ! grep -q SteamOS /etc/os-release ; then
        echo "This script should only be run on a Steam Deck running SteamOS"
        exit 1
fi
if [ "$EUID" -eq 0 ]; then
        echo "This script should not be run as root"
        exit 1
fi

AUR_BASE='https://builds.garudalinux.org/repos/chaotic-aur/x86_64/'

VKBASALT_PKG_VER=$(curl ${AUR_BASE} 2>/dev/null | grep -o 'vkbasalt-[0-9\.a-z-]*-x86_64' | head -1)
VKBASALT_PKG="${VKBASALT_PKG_VER}.pkg.tar.zst"
VKBASALT_LIB32_PKG="lib32-${VKBASALT_PKG}"

GOVERLAY_PKG_VER=$(curl ${AUR_BASE} 2>/dev/null | grep -o 'goverlay-git-[0-9\.a-z-]*-x86_64' | head -1)
GOVERLAY_PKG="${GOVERLAY_PKG_VER}.pkg.tar.zst"

REPLAY_SORCERY_PKG_VER=$(curl ${AUR_BASE} 2>/dev/null | grep -o 'replay-sorcery-git-[0-9\.a-z-]*-x86_64' | head -1)
REPLAY_SORCERY_PKG="${REPLAY_SORCERY_PKG_VER}.pkg.tar.zst"

aria2c "${AUR_BASE}${VKBASALT_PKG}"
aria2c "${AUR_BASE}${VKBASALT_LIB32_PKG}"
aria2c "${AUR_BASE}${GOVERLAY_PKG}"
aria2c "${AUR_BASE}${REPLAY_SORCERY_PKG}"

sudo pacman -U --noconfirm ./${VKBASALT_PKG} ./${VKBASALT_LIB32_PKG} ./${GOVERLAY_PKG} ./${REPLAY_SORCERY_PKG}

rm ${VKBASALT_PKG} ${VKBASALT_LIB32_PKG} ${GOVERLAY_PKG} ${REPLAY_SORCERY_PKG}
