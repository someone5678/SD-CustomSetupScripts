#!/usr/bin/sh -x

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
export PATH=$HOME/.local/bin:$PATH
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/extras/install-podman | sh -s -- --prefix ~/.local
export PATH=$HOME/.local/podman/bin:$PATH

distrobox create --image ghcr.io/steamdeckhomebrew/holo-base:latest --name holo
