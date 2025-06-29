#!/bin/sh

set -o errexit
set -o nounset
set -o xtrace

# Version control ~/.config (Not really useful, too much arbit there)
cd ~/.config
if ! test -d .git; then
  git init && git add . && git commit -m init
fi

# Keyboard layout: Dvorak
xfconf-query -c keyboard-layout -np /Default/XkbDisable -t bool -s false
xfconf-query -c keyboard-layout -np /Default/XkbLayout  -t string -s us
xfconf-query -c keyboard-layout -np /Default/XkbVariant -t string -s dvorak

# [Keyboard > Layout] Right "win" as Compose
xfconf-query -c keyboard-layout -p /Default/XkbOptions/Compose -t string -ns compose:rwin

# [Appearance > Fonts] Default
fc-list -q 'Adwaita Sans' && \
    xfconf-query -c xsettings -np /Gtk/FontName -t string -s 'Adwaita Sans 10'
# [Appearance > Fonts] Default monospace
fc-list -q 'Fira Code' && \
    xfconf-query -c xsettings -np /Gtk/MonospaceFontName -t string -s 'Fira Code 10'

# [Terminal] "Disable all menu access keys (such as Alt + f)"
xfconf-query -c xfce4-terminal -np /shortcuts-no-mnemonics -t bool -s true
# [Terminal] Disable "Show unsafe paste dialog"
xfconf-query -c xfce4-terminal -np /misc-show-unsafe-paste-dialog -t bool -s false
# [Terminal] Width and height
xfconf-query -c xfce4-terminal -np /misc-default-geometry -t string -s 107x24
# [Terminal] Use system font
xfconf-query -c xfce4-terminal -np /font-use-system -t bool -s true
# [Terminal] Use system theme
xfconf-query -c xfce4-terminal -np /color-use-theme -t bool -s true
# [Terminal] Increase line height
xfconf-query -c xfce4-terminal -np /cell-height-scale -t double -s 1.1
# [Terminal]  Disable scrollbar
xfconf-query -c xfce4-terminal -np /scrolling-bar -t string -s TERMINAL_SCROLLBAR_NONE

# [Workspaces] Count 4 => 1
xfconf-query -c xfwm4 -p /general/workspace_count -n -t int -ns 1
# [Workspaces > Margins] Add margins to screen edges
xfconf-query -c xfwm4 -p /general/margin_top -n -t int -ns 20
xfconf-query -c xfwm4 -p /general/margin_bottom -n -t int -ns 30
xfconf-query -c xfwm4 -p /general/margin_left -n -t int -ns 10
xfconf-query -c xfwm4 -p /general/margin_right -n -t int -ns 10

# [Window manager tweaks > Cycling] Enable "Cycle through windows in a list"
xfconf-query -c xfwm4 -p /general/cycle_tabwin_mode -n -t int -ns 1

# [Window manager tweaks > Compositor]
# Disable "Show windows preview in place of icons when cycling"
#
# Note: Doesn't do anything when cycle_tabwin_mode is 1.
xfconf-query -c xfwm4 -p /general/cycle_preview -n -t bool -s false

# [Appearance > Style]
# Use Adwaita light GTK theme (requires `apk add adw-gtk3`)
apk info -e adw-gtk3 && \
    xfconf-query -c xsettings -p /Net/ThemeName -t string -ns adw-gtk3
# [Appearance > Icons]
# Use Adwaita Xfce icons them (requires `apk add adwaita-xfce-icon-theme`)
apk info -e adwaita-xfce-icon-theme && \
    xfconf-query -c xsettings -p /Net/IconThemeName -t string -ns adwaita-xfce

# [Appearance > Style] Enable "Set matching Xfwm4 theme if there is one"
xfconf-query -c xsettings -p /Xfce/SyncThemes -t bool -ns true

# [Panel > Appearance]
# Make panel follow system theme by disabling "Dark mode"
xfconf-query -c xfce4-panel -p /panels/dark-mode -t bool -ns false

# [Desktop > Desktop Icons] Icon type: None
xfconf-query -c xfce4-desktop -p /desktop-icons/style -t int -ns 0

# App Finder - Various tweaks
xfconf-query -c xfce4-appfinder -p /single-click-execute -t bool -ns true
xfconf-query -c xfce4-appfinder -p /sort-by-frecency -t bool -ns true
xfconf-query -c xfce4-appfinder -p /icon-view -t bool -ns true
xfconf-query -c xfce4-appfinder -p /text-beside-icons -t bool -ns true
xfconf-query -c xfce4-appfinder -p /remember-category -t bool -ns true
xfconf-query -c xfce4-appfinder -p /close-on-focus-lost -t bool -ns true
xfconf-query -c xfce4-appfinder -p /always-center -t bool -ns false
xfconf-query -c xfce4-appfinder -p /hide-category-pane -t bool -ns false
