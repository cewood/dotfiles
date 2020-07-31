#                         oooo                                          
#                         `888                                          
#       oooooooo  .oooo.o  888 .oo.    .ooooo.  ooo. .oo.   oooo    ooo 
#      d'""7d8P  d88(  "8  888P"Y88b  d88' `88b `888P"Y88b   `88.  .8'  
#        .d8P'   `"Y88b.   888   888  888ooo888  888   888    `88..8'   
# .o.  .d8P'  .P o.  )88b  888   888  888    .o  888   888     `888'    
# Y8P d8888888P  8""888P' o888o o888o `Y8bod8P' o888o o888o     `8'     
#
# This is the 1st file zsh reads; it's read for every shell, execpt if zsh
# is started with -f. It should contain commands to set the command search
# path, plus other important environment variables; it should not contain
# commands that produce output or assume the shell is attached to a tty.MOT
#
# https://wiki.archlinux.org/index.php/zsh#Configuration_files
# http://zshwiki.org/home/config/files#when_are_they_read
# http://zsh.sourceforge.net/Doc/Release/Files.html#SEC26
# http://zsh.sourceforge.net/FAQ/zshfaq03.html#l19


#====================================================================
# Variables
#====================================================================

# The lazy path.d path importer
for file in $(/usr/bin/env find ${HOME}/local/path.d -type d); do
	if [[ -d ${file} ]]; then PATH=$PATH:${file}; export PATH; fi
done


PATH=$PATH:/usr/local/bin
PATH=${HOME}/local/bin:$PATH
export PATH

CDPATH=.
CDPATH=$CDPATH:$HOME
export CDPATH


##
# From https://wiki.archlinux.org/index.php/GNOME/Keyring#Without_a_display_manager
#
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID



#====================================================================
# Snippets
#====================================================================

for file in $(/usr/bin/env find ${HOME}/.config/zsh/enabled.d/ -name \*.zshenv); do
	if [[ -L ${file} ]]; then source ${file}; fi
done
