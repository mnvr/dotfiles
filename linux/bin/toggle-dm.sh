#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

# Workaround for Xfce 4.20 always displaying the dark variant of Advaita theme
# (not sure where the issue is, this just copies the upstream theme and removes
# gtk-dark.css from it).
if ! test -d ~/.local/share/themes/adw-gtk3-mod
then
    mkdir -p ~/.local/share/themes
    cp -r /usr/share/themes/adw-gtk3 ~/.local/share/themes/adw-gtk3-mod
    cd ~/.local/share/themes/adw-gtk3-mod
    sed -i 's/adw-gtk3/adw-gtk3-mod/' index.theme
    rm gtk-3.0/gtk-dark.css
    cd -
fi

theme="adw-gtk-dark"
xfconf-query -c xsettings -p /Net/ThemeName | grep -q dark && theme="adw-gtk-mod"
xfconf-query -c xsettings -p /Net/ThemeName -t string -ns $theme
