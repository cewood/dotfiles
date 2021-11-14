#!/bin/bash

##
# From https://wiki.archlinux.org/title/Xinit#Configuration
#
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Source the xprofile
[[ -f ~/.xprofile ]] && ~/.xprofile

# Source our xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Remap Caps to Super, and Shift_L + Sift_R = Toggle_Caps
setxkbmap -option "shift:both_capslock"
setxkbmap -option "caps:super"

# Set the keyboard layout to US Int, so we can type ü and ß type chars
setxkbmap us altgr-intl

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
