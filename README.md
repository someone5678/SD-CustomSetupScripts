# Personal Steam Deck Setup/Update scripts

Bunch of shell scripts for easy setup/update apps (in SteamOS) on [Steam Deck](https://store.steampowered.com/steamdeck)  for my personal use.
<br>Sourced from various Steam Deck related repo/news/guides.

## Note

1. Most of custom apps will installed on your SDCard.
2. These scripts are considered to use with [EmuDeck](https://www.emudeck.com). So scripts will point out [EmuDeck](https://www.emudeck.com)'s folders.
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

## List of installable softwares that supported in this repo

* [rwfus](https://github.com/ValShaped/rwfus) (RW OverlayFS for Steam Deck to keep system modification even after os update)
* [Distrobox](https://github.com/89luca89/distrobox) (For install [SteamDeckHomebrew](https://github.com/SteamDeckHomebrew)'s [holo-docker image](https://github.com/SteamDeckHomebrew/holo-docker) for developement)

* [ArchLinux](https://archlinux.org/) packages (System installation) (Install these after install [rwfus](https://github.com/ValShaped/rwfus))
  * [goverlay](https://github.com/benjamimgois/goverlay) and dependencies
  * Other locales (JP, KR) install script through [glibc](https://www.gnu.org/software/libc) installation
  * Misc package install script
            <details>
                <summary>List of softwares</summary>
                * [paru](https://github.com/Morganamilo/paru)
                <br>* [aria2](http://aria2.sourceforge.net/)
                <br>* [fakeroot](https://tracker.debian.org/pkg/fakeroot)
                <br>* [gcc](https://gcc.gnu.org/)
                <br>* [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/)
                <br>* [make](https://www.gnu.org/software/make)
                <br>* [npm](https://www.npmjs.com/)
                <br>* [pnpm](https://github.com/pnpm/pnpm)
                <br>* [Visual Studio Code](https://code.visualstudio.com/)
                <br>* [xdelta3](http://xdelta.org/)
            </details>

* Build/Install Scripts
  * [Waydroid](https://github.com/waydroid) (Run ```build.sh``` after install and run [holo-docker](https://github.com/SteamDeckHomebrew/holo-docker) [image](https://github.com/SteamDeckHomebrew/holo-docker/pkgs/container/holo-base) on [DistroBox](https://github.com/89luca89/distrobox))
  * [AutoCpuFreq](https://github.com/AdnanHodzic/auto-cpufreq)
  * [preload](http://sourceforge.net/projects/preload)

* [Flatpak](https://flatpak.org/) (that included in install script)
  * [Discord](https://discord.com/)
  * [Flatseal](https://github.com/tchx84/Flatseal)
  * [MangoHud](https://github.com/flightlessmango/MangoHud)
  * [Prism Launcher](https://github.com/PrismLauncher/PrismLauncher)
  * [Protontricks](https://github.com/Matoking/protontricks)
  * [ProtonUp-Qt](https://github.com/DavidoTek/ProtonUp-Qt)
  * [SGDBoop](https://www.steamgriddb.com/boop)

* Portable Apps
  * [Bandizip](https://en.bandisoft.com/bandizip/) Portable (For decompressing non UTF-8 unicoded archive format files)
  * [bauh](https://github.com/vinifmor/bauh)
  * [BoilR](https://github.com/PhilipK/BoilR)
  * [doukutsu-rs](https://github.com/doukutsu-rs/doukutsu-rs)
  * [EasyRPG Player](https://easyrpg.org/player/downloads/#release-linux)
  * [KDE Plasma Nested](https://gist.github.com/davidedmundson/8e1732b2c8b539fd3e6ab41a65bcab74) ([KDE](https://kde.org/) [Plasma](https://kde.org/plasma-desktop/) on [Wayland](https://wayland.freedesktop.org/))
  * [pineappleEA](https://github.com/pineappleEA/pineapple-src) (Replaces [EmuDeck](https://www.emudeck.com)'s [Yuzu](https://yuzu-emu.org/) mainline binary)
  * [Ryujinx](https://github.com/Ryujinx/Ryujinx) Ava (Replaces [EmuDeck](https://www.emudeck.com)'s [Ryujinx](https://ryujinx.org/) binaries and modifies launcher shell script)
  * [Steam Deck SD Card Scanner](https://github.com/ddotthomas/SteamDeck_SD_Card_Scanner)
  * [Steam Deck Trigger Calibration Overwriting Tool](https://github.com/kasvtv/steam_deck_overwrite_trigger_cal)

* Other softwares
  * [Steam Deck Software Undervolt](https://github.com/KyleGospo/Steam-Deck-Software-Undervolt/) install script
  * [Steam-Deck.Mount-External-Drive](https://github.com/scawp/Steam-Deck.Mount-External-Drive)
  * [CryoUtilities](https://github.com/CryoByte33/steam-deck-utilities)
  * [Zsh](https://www.zsh.org/)/[Oh-My-Zsh](https://ohmyz.sh/) setup script

# Other useful softwares

* [Decky Loader](https://github.com/SteamDeckHomebrew/decky-loader): A plugin loader for the Steam Deck. 
* [EmuDeck](https://www.emudeck.com): Emulator configurator for Steam Deck.
* [SteamDeck Refresh Rate Unlocker](https://github.com/ryanrudolfoba/SteamDeck-RefreshRateUnlocker): Unlock the display panel to use upto 70Hz refresh rate.

# References

* [vkbaslt install script](https://github.com/simons-public/steam-deck-vkbasalt-install) (Modified to install goverlay and it's dependencies using pkgs from [Chaotic-AUR](https://aur.chaotic.cx/))
* [japanese_locale_enabler](https://gist.github.com/XargonWan/cc660daf92c224b7241cbf5a2bf12c47) (Modified script to install other languages too)
* [Steam Deck Tricks](https://gitlab.com/popsulfr/steam-deck-tricks) ([Waydroid](https://github.com/waydroid/waydroid), [AutoCpuFreq](https://github.com/AdnanHodzic/auto-cpufreq) build/install commands, and various guides. Adapted [AutoCpuFreq](https://github.com/AdnanHodzic/auto-cpufreq) build/install commands for [preload](http://sourceforge.net/projects/preload))
