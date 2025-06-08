#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

xfconf-query -c keyboard-layout -p /Default/XkbDisable -s false
xfconf-query -c keyboard-layout -p /Default/XkbLayout  -s us
xfconf-query -c keyboard-layout -p /Default/XkbVariant -s dvorak


