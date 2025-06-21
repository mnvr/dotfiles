#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

# Version control ~/.config (Not really useful)
cd ~/.config
if ! test -d .git; then
  git init && git add . && git commit -m init
fi

# Keyboard layout: Dvorak
xfconf-query -c keyboard-layout -np /Default/XkbDisable -t bool -s false
xfconf-query -c keyboard-layout -np /Default/XkbLayout  -t string -s us
xfconf-query -c keyboard-layout -np /Default/XkbVariant -t string -s dvorak

# Terminal: "Disable all menu access keys (such as Alt + f)"
xfconf-query -c xfce4-terminal -np /shortcuts-no-mnemonics -t bool -s true
