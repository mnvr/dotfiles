#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

doas apk add docs mandoc-apropos
doas apk add git zsh file coreutils less curl jq

d=`pwd`
link () {
    cd ~/`dirname $1`
    ln -s "$d/$1" || readlink "$1"
}

link .gitconfig
link .zshrc
link .emacs.d/init.el
