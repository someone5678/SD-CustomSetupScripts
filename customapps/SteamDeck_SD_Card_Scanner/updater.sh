#!/usr/bin/sh -x

cd /run/media/mmcblk0p1/customapps/SteamDeck_SD_Card_Scanner/

rm -Rf steamdeck_sd_card_scanner

FILE=$(curl -s https://api.github.com/repos/ddotthomas/SteamDeck_SD_Card_Scanner/releases/latest \
| grep -e "https.*steamdeck_sd_card_scanner" \
| cut -d : -f 2,3 \
| tr -d \" \
)

aria2c --quiet=true --input-file=$FILE

chmod +x steamdeck_sd_card_scanner
