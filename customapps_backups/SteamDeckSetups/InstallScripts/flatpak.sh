#!/usr/bin/sh -x

sudo flatpak update

flatpak install flatseal sgdboop pupgui2 com.github.Matoking.protontricks prismlauncher com.discordapp.Discord -y

flatpak install runtime/org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/22.08 -y

flatpak override --user --filesystem=/run/media/mmcblk0p1 com.github.Matoking.protontricks
