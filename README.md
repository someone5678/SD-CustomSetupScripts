# Personal Steam Deck Setup/Update scripts

Bunch of shell scripts for easy setup/update apps on Steam Deck (SteamOS) for personal use.
Sourced from various Steam Deck related repo/news/guides.

## Note

1. Most of custom apps will installed on your SDCard.
2. These scripts are considered to use with EmuDeck. So scripts will point out EmuDeck's folders.
3. When add these scripts to Steam Library, setup like below will gave you much better experience.
<details>
    <summary>Example of Steam Library Shortcut Setup</summary>
e.g. Bandizip
<br>
TARGET: env
<br>
START IN: /run/media/mmcblk0p1/customapps/BANDIZIP-PORTABLE/
<br>
LAUNCH OPTIONS: -u LD_PRELOAD konsole --fullscreen --notransparency -e /run/media/mmcblk0p1/customapps/BANDIZIP-PORTABLE/updater.sh
<br>
<br>

Ref: [Steam Deck Tricks: Add konsole (terminal) to Steam Deck UI](https://gitlab.com/popsulfr/steam-deck-tricks#add-konsole-terminal-to-steam-deck-ui)
</details>

4. All of the system tinkering will use [rwfus](https://github.com/ValShaped/rwfus).
5. After install MangoHud Flatpak, following [this guide](https://gitlab.com/popsulfr/steam-deck-tricks#gamescope-fps-limiter-not-working-on-flatpaks) in [Steam Deck Tricks](https://gitlab.com/popsulfr/steam-deck-tricks) repo to fix fps limiter in Gamescope
# Other useful softwares

* [Decky Loader](https://github.com/SteamDeckHomebrew/decky-loader): A plugin loader for the Steam Deck. 
* [EmuDeck](https://www.emudeck.com): Emulator configurator for Steam Deck.
* [SteamDeck Refresh Rate Unlocker](https://github.com/ryanrudolfoba/SteamDeck-RefreshRateUnlocker): Unlock the display panel to use upto 70Hz refresh rate.
