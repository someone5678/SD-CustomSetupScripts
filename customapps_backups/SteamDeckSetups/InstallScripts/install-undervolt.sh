#!/usr/bin/sh -x

git clone https://github.com/KyleGospo/Steam-Deck-Software-Undervolt/

cd Steam-Deck-Software-Undervolt

sudo rsync -a ./etc / >/dev/null
rsync -a ./home/deck/.local/bin /home/deck/.local/ >/dev/null

cd ../
rm -Rf Steam-Deck-Software-Undervolt

sudo udevadm control --reload-rules
sudo systemctl disable set-ryzenadj-tweaks.service
sudo systemctl start set-ryzenadj-tweaks.service
sudo systemctl enable set-ryzenadj-tweaks.service
