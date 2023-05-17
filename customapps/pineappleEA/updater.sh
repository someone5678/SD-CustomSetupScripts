#!/usr/bin/sh -x

cd /home/deck/Applications/

rm -Rf yuzu.AppImage

FILE=$(curl -s https://api.github.com/repos/pineappleEA/pineapple-src/releases/latest \
| grep -e "https.*Linux-.*Yuzu.*" \
| cut -d : -f 2,3 \
| tr -d \" \
)

aria2c --quiet=true --input-file=$FILE

mv *Yuzu*.AppImage yuzu.AppImage 
chmod +x yuzu.AppImage
