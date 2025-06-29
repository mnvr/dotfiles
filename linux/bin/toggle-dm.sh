#!/bin/sh

set -o errexit
set -o nounset

# This script toggles between the light and dark variants of the default theme.
#
# Workaround for Xfce 4.20 always displaying the dark variant of Advaita theme
# (not sure where the issue is, but setting the theme name to "adw-gtk" instead
# of the correct value "adw-gtk3" gets the light variant to show up).

theme="adw-gtk3-dark"
xfconf-query -c xsettings -p /Net/ThemeName | grep -q dark && theme="adw-gtk"
xfconf-query -c xsettings -p /Net/ThemeName -t string -ns $theme
