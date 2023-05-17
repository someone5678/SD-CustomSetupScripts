#!/usr/bin/sh -x

cd /run/media/mmcblk0p1/customapps/bauh/

rm -Rf bauh.AppImage

FILE=$(curl -s https://api.github.com/repos/vinifmor/bauh/releases/latest \
| grep "https.*bauh-.*.AppImage\"" \
| cut -d : -f 2,3 \
| tr -d \" \
)

aria2c --quiet=true --input-file=$FILE

mv bauh*.AppImage bauh.AppImage 
chmod +x bauh.AppImage
