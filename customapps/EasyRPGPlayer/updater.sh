#!/usr/bin/sh -x

cd /run/media/mmcblk0p1/customapps/EasyRPGPlayer/
rm -Rf easyrpg-player
aria2c https://ci.easyrpg.org/downloads/linux/easyrpg-player-static.tar.gz
tar -xvzf easyrpg-player-static.tar.gz
rm -Rf easyrpg-player-static.tar.gz
chmod +x easyrpg-player
