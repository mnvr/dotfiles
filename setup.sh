#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

d=$(pwd)
cd ~
rm -f .zshrc && ln -s "$d/.zshrc"
rm -f .gitconfig && ln -s "$d/.gitconfig"
mkdir -p .emacs.d && cd .emacs.d
rm -f init.el && ln -s "$d/.emacs.d/init.el"
cd .. && mkdir -p .config/git && cd .config/git
rm -f ignore && ln -s "$d/.config/git/ignore"
cd ../..

# TextEdit open blank document (Requires logout)
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
