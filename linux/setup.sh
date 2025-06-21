#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

doas apk add docs coreutils curl jq

d=`pwd`
link () {
    cd ~/`dirname $1`
    ln -s "$d/$1" || readlink "$1"
}

link .gitconfig
link .profile
link .ashrc
link .emacs.d/init.el
