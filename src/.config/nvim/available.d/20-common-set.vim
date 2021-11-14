"===============================================================================
" Set Settings
"===============================================================================

" Sets how many lines of history vim has to remember
set history=10000

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

set wildmode=list:longest,full
set wildmenu "turn on wild menu

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Make search act like search in modern browsers
set incsearch

" Don't show matching brackets
"set noshowmatch

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Always show the statusline
set laststatus=2

" Explicitly set encoding to utf-8
"set encoding=utf-8

" Column width indicator
set colorcolumn=+1

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Always splits to the right and below
set splitright
set splitbelow

" 256bit terminal
set t_Co=256

set nojoinspaces         " What am I using this for?
"set autochdir            " Also what's this for?
"set directory=~/.vimtmp/ " Do I need this?
set guioptions-=T        " remove toolbar
set title                " Set the terminal title
set visualbell           " Visual bell, duh!
setlocal spell
"filetype off             " required! by Vundle originaly, iirc?


" Set the correct color capabilities for the terminal in use,
"  see https://neovim.io/doc/user/term.html for details
"
if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
  set notermguicolors
elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
  set termguicolors
elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
  if $XTERM_VERSION != ''
    set termguicolors
  elseif $KONSOLE_PROFILE_NAME != ''
    set termguicolors
  elseif $VTE_VERSION != ''
    set termguicolors
  else
    set notermguicolors
  endif
endif

" " Enable true color support
" set termguicolors

" Re-enable the mouse in neovim 0.2+
set mouse=a
