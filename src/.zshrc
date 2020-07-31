#                         oooo                           
#                         `888                           
#       oooooooo  .oooo.o  888 .oo.   oooo d8b  .ooooo.  
#      d'""7d8P  d88(  "8  888P"Y88b  `888""8P d88' `"Y8 
#        .d8P'   `"Y88b.   888   888   888     888       
# .o.  .d8P'  .P o.  )88b  888   888   888     888   .o8 
# Y8P d8888888P  8""888P' o888o o888o d888b    `Y8bod8P' 
#
# Read after zprofile, if the shell is an interactive shell.
# This is Zsh's main configuration file.
#
# https://wiki.archlinux.org/index.php/zsh#Configuration_files
# http://zshwiki.org/home/config/files#when_are_they_read
# http://zsh.sourceforge.net/Doc/Release/Files.html#SEC26
# http://zsh.sourceforge.net/FAQ/zshfaq03.html#l19


#====================================================================
# Variables
#====================================================================



#====================================================================
# Aliases
#====================================================================



#====================================================================
# Functions
#====================================================================



#====================================================================
# Snippets
#====================================================================

for file in $(find ${HOME}/.config/zsh/enabled.d/ -name \*.zshrc); do
	if [[ -L ${file} ]]; then source ${file}; fi
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cewood/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cewood/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cewood/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cewood/google-cloud-sdk/completion.zsh.inc'; fi
