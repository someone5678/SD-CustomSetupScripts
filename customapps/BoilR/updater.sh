#!/usr/bin/sh -x

cd /run/media/mmcblk0p1/customapps/BoilR/

rm -Rf linux_BoilR

FILE=$(curl -s https://api.github.com/repos/PhilipK/BoilR/releases/latest \
| grep -e "https.*/linux_BoilR\"" \
| cut -d : -f 2,3 \
| tr -d \" \
)

aria2c --quiet=true --input-file=$FILE

chmod +x linux_BoilR
