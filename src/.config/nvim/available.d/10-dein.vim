"===============================================================================
" Dein configuration
"===============================================================================

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.local/share/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/nvim/dein')
  call dein#begin('~/.local/share/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/nvim/dein/repos/github.com/Shougo/dein.vim')


  " Utilities
  " ============================================================================

  " Utility comamnds of dein.vim with rich completion.
  call dein#add('haya14busa/dein-command.vim', { 'rev': '46457d0' })

  " Quickly locate faulty plugins, using binary search
  call dein#add('dahu/bisectly', { 'rev': 'cff50c7' })

  " Dark powered asynchronous completion framework for neovim
  call dein#add('Shougo/deoplete.nvim', { 'rev': '523eebf' })

  " Dark powered asynchronous unite all interfaces for Neovim/Vim8
  call dein#add('Shougo/denite.nvim', { 'rev': '8b1dc78' })

  " Vim plugin that displays tags in a window, ordered by scope
  call dein#add('majutsushi/tagbar', { 'rev': '959f487' })

  " Asynchronous linting and make framework for Neovim/Vim
  call dein#add('neomake/neomake', { 'rev': 'dfaf390' })

  " Run your tests at the speed of thought
  call dein#add('janko-m/vim-test', { 'rev': '453db3d' })

  " Asynchronous Lint Engine
  call dein#add('w0rp/ale', { 'rev': 'fef3276' })



  " Search
  " ============================================================================

  " Helm-swoop inspired multi-buffer search and replace tool
  call dein#add('pelodelfuego/vim-swoop', { 'rev': '41f969a' })

  " Improved incremental searching for Vim
  call dein#add('haya14busa/incsearch.vim', { 'rev': '213994f' })

  " Helps you win at grep
  call dein#add('mhinz/vim-grepper', { 'rev': 'df7e310' })

  " NeoVim/Vim plugin performing project-wide async search and replace
  call dein#add('eugen0329/vim-esearch', { 'rev': '1253488' })



  " Version control
  " ============================================================================

  " Magit inspired git workflow for Vim
  call dein#add('jreybert/vimagit', { 'rev': 'cafba10' })

  " An awesome git handling plugin for Vim
  call dein#add('lambdalisue/vim-gita', { 'rev': '3f5a807' }, { 'on_cmd': 'Gita' })

  " A Git wrapper so awesome, it should be illegal
  call dein#add('tpope/vim-fugitive', { 'rev': 'f44845e' })

  " Show a changes using Vim's sign column
  call dein#add('mhinz/vim-signify', { 'rev': '01bcf8a' })



  " Filetype support
  " ============================================================================

  " EditorConfig plugin for Vim
  call dein#add('editorconfig/editorconfig-vim', { 'rev': 'a459b8c' })

  " A solid language pack for Vim
  call dein#add('sheerun/vim-polyglot', { 'rev': 'fbeb019' })

  " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
  call dein#add('python-mode/python-mode', { 'rev': 'd113cff' })

  " Go development plugin for Vim
  call dein#add('fatih/vim-go', { 'rev': 'fatih/vim-go' })



  " Text editing
  " ============================================================================

  " Vim motions on speed!
  call dein#add('easymotion/vim-easymotion', { 'rev': 'af9786e' })

  " A Vim alignment plugin
  call dein#add('junegunn/vim-easy-align', { 'rev': '3b395bd' })

  " True Sublime Text style multiple selections for Vim
  call dein#add('terryma/vim-multiple-cursors', { 'rev': '51d0717' })

  " Comment stuff out
  call dein#add('tpope/vim-commentary', { 'rev': '73e0d9a' })

  " Enable repeating supported plugin maps with "."
  call dein#add('tpope/vim-repeat', { 'rev': '7a6675f' })

  " Quoting/parenthesizing made simple
  call dein#add('tpope/vim-surround', { 'rev': 'e49d6c2' })

  " Vim plugin for intensely orgasmic commenting
  call dein#add('scrooloose/nerdcommenter', { 'rev': '59552f2' })

  " Plugin to toggle, display and navigate marks
  call dein#add('kshenoy/vim-signature', { 'rev': '7e13913' })



  " Writing plugins
  " ============================================================================

  " Uncover usage problems in your writing
  call dein#add('reedes/vim-wordy', { 'rev': 'bd37684' })

  " Rethinking Vim as a tool for writing
  call dein#add('reedes/vim-pencil', { 'rev': '6d01570' })



  " Miscellaneous
  " ============================================================================

  " The fancy start screen for Vim
  call dein#add('mhinz/vim-startify', { 'rev': '5e9e6a4' })

  " Lean & mean status/tabline for vim that's light as air
  call dein#add('vim-airline/vim-airline', { 'rev': 'b66c1ef' })

  " Helpers for UNIX
  call dein#add('tpope/vim-eunuch', { 'rev': '7eeb681' })

  " The ultimate undo history visualizer for Vim
  call dein#add('mbbill/undotree', { 'rev': '17dfeb6' })

  " Heuristically set buffer options
  call dein#add('tpope/vim-sleuth', { 'rev': '62c4f26' })

  " Combine with netrw to create a delicious salad dressing
  call dein#add('tpope/vim-vinegar', { 'rev': 'bd7f7b7' })

  " Continuously updated session files
  call dein#add('tpope/vim-obsession', { 'rev': 'ad1ef9a' })

  " Bbye (Buffer Bye) for Vim
  call dein#add('moll/vim-bbye', { 'rev': 'a018cbc' })

  " BufExplorer Plugin for Vim
  call dein#add('jlanzarotta/bufexplorer', { 'rev': '9e1e111' })

  " Vim plugin to list, select and switch between buffers.
  call dein#add('jeetsukumaran/vim-buffergator', { 'rev': '04dfbc0' })

  " Fast and efficient buffer switching for Vim
  call dein#add('mihaifm/bufstop', { 'rev': '9274df4' })

  " Switching between buffers in Vim with a handy menu.
  call dein#add('mcmlxxxiii/buffy.vim', { 'rev': '7d27539' })



  " Colorschemes
  " ============================================================================

  " Alter Vim's appearance to suit your task & environ
  call dein#add('reedes/vim-thematic', { 'rev': '5bc225d' })

  " Colorsheme Scroller, Chooser, and Browser
  call dein#add('vim-scripts/ScrollColors', { 'rev': '2ce50b9' })

  " One colorscheme pack to rule them all! Always check here first
  call dein#add('flazz/vim-colorschemes', { 'rev': 'b8dff40' })

  " Precision colorscheme for the vim text editor
  call dein#add('altercation/vim-colors-solarized', { 'rev': '528a59f' })

  " Base16 for Vim
  call dein#add('chriskempson/base16-vim', { 'rev': 'f6e70df' })

  " Tomorrow Theme the precursor to Base16 Theme
  call dein#add('chriskempson/vim-tomorrow-theme', { 'rev': '46994f3' })

  " A colorful, dark color scheme for Vim
  call dein#add('nanotech/jellybeans.vim', { 'rev': 'fdc7b7e' })

  " Low-contrast Vim color scheme based on Seoul Colors
  call dein#add('junegunn/seoul256.vim', { 'rev': 'af0f087' })

  " For high readability, optimal visibility, and eye comfortable.
  call dein#add('zeis/vim-kolor', { 'rev': '29fd6ce' })

  " Retro groove color scheme for Vim
  call dein#add('morhetz/gruvbox', { 'rev': '127c9d1' })

  " Light & Dark Vim color schemes inspired by Google's Material Design
  call dein#add('NLKNguyen/papercolor-theme', { 'rev': '0826f9d' })

  " A dark Vim color scheme inspired by Atom's One Dark syntax theme.
  call dein#add('joshdick/onedark.vim', { 'rev': 'd5cc6e7' })

  " A fixed solarized colorscheme for better truecolor support.
  call dein#add('icymind/NeoSolarized', { 'rev': '3d18f83' })

  "" Description here
  "call dein#add('', { 'rev': '' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
