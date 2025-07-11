#!/bin/sh

set -o errexit
set -o xtrace

cd ~/Downloads

test -f noise-texture.png ||
curl -Lo noise-texture.png 'https://gitlab.gnome.org/GNOME/gnome-shell/-/raw/0b9a5c3441419014c1fa0e6302df3a03519c4315/data/theme/noise-texture.png?inline=false'

base=/backdrop/screen0/monitorVirtual-1/workspace0

xfconf-query -c xfce4-desktop -p $base/last-image -t string -ns $HOME/Downloads/noise-texture.png
xfconf-query -c xfce4-desktop -p $base/image-style -t int -ns 2
xfconf-query -c xfce4-desktop -p $base/color-style -t int -ns 0
xfconf-query -c xfce4-desktop -p $base/rgba1 -n -t double -s 0.5 \
  -t double -s 0.5 \
  -t double -s 0.5 \
  -t double -s 1
