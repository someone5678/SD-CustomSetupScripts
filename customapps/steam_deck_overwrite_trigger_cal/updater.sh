#!/usr/bin/sh -x

cd /run/media/mmcblk0p1/customapps/steam_deck_overwrite_trigger_cal/

rm -Rf overwrite_trigger_cal

FILE=$(curl -s https://api.github.com/repos/kasvtv/steam_deck_overwrite_trigger_cal/releases/latest \
| grep -e "https.*download.*overwrite_trigger_cal" \
| cut -d : -f 2,3 \
| tr -d \" \
)

aria2c --quiet=true --input-file=$FILE

chmod +x overwrite_trigger_cal
