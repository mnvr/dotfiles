#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

d=$(pwd)
cd ~
ln -s "$d/.gitconfig"
ln -s "$d/.profile"
ln -s "$d/.ashrc"    
