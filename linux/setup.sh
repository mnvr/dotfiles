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

# Modify Xfce and friends ---

sh config.sh
