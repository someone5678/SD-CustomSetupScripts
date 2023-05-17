#!/usr/bin/sh -x

cd /home/deck/Applications/

FILE=$(curl -s https://api.github.com/repos/Ryujinx/release-channel-master/releases/latest \
| grep -e "https.*ava-.*linux" \
| cut -d : -f 2,3 \
| tr -d \" \
)

aria2c --quiet=true --input-file=$FILE

tar -xzvf *ava-ryujinx-*linux*tar.gz
rm *ava-ryujinx-*linux*tar.gz

sed -i 's/emuName\=\"Ryujinx\"/emuName\=\"Ryujinx.Ava\"/g' /run/media/mmcblk0p1/Emulation/tools/launchers/ryujinx.sh
