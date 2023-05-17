# Personal Steam Deck Setup/Update scripts

Bunch of shell scripts for easy setup/update apps on Steam Deck (SteamOS) for personal use.
Sourced from various Steam Deck related repo/news/guides.

## Note

1. Most of custom apps will installed on your SDCard.
2. These scripts are considered to use with EmuDeck. So scripts will point out EmuDeck's folders.
3. When add these scripts to Steam Library setup like below will gave you much better experience.

TARGET:
```
env
```
START IN:
<br>Location of dir that contains script. For example, BANDIZIP-PORTABLE in SDCard's customapps dir.
```
/run/media/mmcblk0p1/customapps/BANDIZIP-PORTABLE/
```
LAUNCH OPTIONS:
<br>Last part is location of script. For example, BANDIZIP-PORTABLE in SDCard's customapps dir.
```
 -u LD_PRELOAD konsole --fullscreen --notransparency -e /run/media/mmcblk0p1/customapps/BANDIZIP-PORTABLE/updater.sh
```

Ref: [Steam Deck Tricks: Add konsole (terminal) to Steam Deck UI](https://gitlab.com/popsulfr/steam-deck-tricks#add-konsole-terminal-to-steam-deck-ui)

4. All of the system tinkering will use [rwfus](https://github.com/ValShaped/rwfus).
