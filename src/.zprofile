#                                               .o88o.  o8o  oooo            
#                                               888 `"  `"'  `888            
#       oooooooo oo.ooooo.  oooo d8b  .ooooo.  o888oo  oooo   888   .ooooo.  
#      d'""7d8P   888' `88b `888""8P d88' `88b  888    `888   888  d88' `88b 
#        .d8P'    888   888  888     888   888  888     888   888  888ooo888 
# .o.  .d8P'  .P  888   888  888     888   888  888     888   888  888    .o 
# Y8P d8888888P   888bod8P' d888b    `Y8bod8P' o888o   o888o o888o `Y8bod8P' 
#                 888                                                        
#                o888o                                                       
#
# Read after zshenv, if the shell is a login shell. This file is generally
# used for automatic execution of user's scripts.
#
# https://wiki.archlinux.org/index.php/zsh#Configuration_files
# http://zshwiki.org/home/config/files#when_are_they_read
# http://zsh.sourceforge.net/Doc/Release/Files.html#SEC26
# http://zsh.sourceforge.net/FAQ/zshfaq03.html#l19

#====================================================================
# Path
#====================================================================

PATH=$PATH:$HOME/local/bin
export PATH



#====================================================================
# Snippets
#====================================================================

for file in $(find ${HOME}/.config/zsh/enabled.d/ -name \*.zprofile); do
	if [[ -L ${file} ]]; then source ${file}; fi
done

export PATH="$HOME/.cargo/bin:$PATH"
