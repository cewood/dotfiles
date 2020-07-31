#!/bin/bash

# Source the xprofile
[[ -f ~/.xprofile ]] && ~/.xprofile

# Source our xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

## Remap Caps to Super, and Shift_L + Sift_R = Toggle_Caps
setxkbmap -option "shift:both_capslock"
setxkbmap -option "caps:super"


##
# Execute our .Xresources file
#
xrdb ~/.Xresources


## Interface scaling
export GDK_SCALE=0
export GDK_DPI_SCALE=0


##
# From https://wiki.archlinux.org/index.php/GNOME/Keyring#Without_a_display_manager
#
eval "$(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID


##
# Propogate DISPLAY vars to Systemd, for more info see this
#  https://wiki.archlinux.org/index.php/Systemd/User#Environment_variables
#
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY


xset b off
setxkbmap -option ctrl:nocaps

case "$1" in
gnome)
    exec /usr/bin/gnome-session
    ;;
i3-gnome)
    exec /usr/bin/i3-gnome
    ;;
*)
    exec /usr/bin/i3
    ;;
esac
