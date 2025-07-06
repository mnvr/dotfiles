#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

d=$(pwd)
cd ~
rm -f .zshrc && ln -s "$d/.zshrc"
rm -f .gitconfig && ln -s "$d/.gitconfig"
cd .. && mkdir -p .config/git && cd .config/git
rm -f ignore && ln -s "$d/.config/git/ignore"
cd ../..

# TextEdit open blank document (Requires logout)
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

# Breaks emacs set-mark-command
echo "TODO: Disable Ctrl-SPC in Keyboard > Shortcuts > Input Sources"
