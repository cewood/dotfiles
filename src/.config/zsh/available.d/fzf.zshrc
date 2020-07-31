##
# fzf specific config
#

# Source zsh completions
if [ -f /usr/share/fzf/completion.zsh ]
then
  source /usr/share/fzf/completion.zsh
fi

# Source zsh key bindings
if [ -f /usr/share/fzf/key-bindings.zsh ]
then
  source /usr/share/fzf/key-bindings.zsh
fi
