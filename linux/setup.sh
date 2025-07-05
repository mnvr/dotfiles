#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

# Add packages ---

doas apk add docs mandoc-apropos
doas apk add git zsh file coreutils less curl jq
doas apk add adwaita-xfce-icon-theme adw-gtk3

# Link config ----

d=`pwd`
link () {
    cd ~/`dirname $1`
    ln -s "$d/$1" || readlink `basename $1`
}

link .gitconfig
link .zshrc
mkdir -p ~/.emacs.d && link .emacs.d/init.el

cd "$d"

# Install Fonts ---

if ! test -d ~/.local/share/fonts/FiraCode
then
    mkdir /tmp/fira && cd /tmp/fira
    wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
    unzip Fira*.zip
    mkdir -p ~/.local/share/fonts/FiraCode
    mv ttf ~/.local/share/fonts/FiraCode
    cd -
    rm -rf /tmp/fira
fi

# Autologin

test -f /etc/lightdm/lightdm.conf.d/50-autologin.conf || \
echo | doas install -D -m 644 /dev/stdin /etc/lightdm/lightdm.conf.d/50-autologin.conf <<EOF
[Seat:*]
autologin-user=$(whoami)
EOF

# Modify Xfce and friends ---

sh config.sh

# A symlink doesn't work, copy the file.
cp share/xfce4-panel.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml
