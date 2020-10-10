"===============================================================================
" Vim-plug configuration
"===============================================================================

"Begin vim-plug scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif


" Required: add vim-plug to the runtimepath
"set runtimepath+=~/.local/share/nvim/vim-plug/plug.vim
"source ~/.local/share/nvim/vim-plug/plug.vim

" Required: specify a directory for plugins
call plug#begin('~/.local/share/nvim/vim-plug')


" Utilities
" ============================================================================

" Asynchronous Lint Engine
Plug 'w0rp/ale', { 'commit': '08295ce' }

" Quickly locate faulty plugins, using binary search
Plug 'dahu/bisectly', { 'commit': 'cff50c7' }

" Dark powered asynchronous completion framework for neovim
Plug 'Shougo/deoplete.nvim', { 'commit': 'e897e01' }

" Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plug 'Shougo/denite.nvim', { 'commit': '7a71d54' }

" " Vim plugin that displays tags in a window, ordered by scope
" Plug 'majutsushi/tagbar', { 'commit': '387bbad' }

" Run your tests at the speed of thought
Plug 'janko-m/vim-test', { 'commit': 'c4b7320' }

" " A Vim plugin that manages your tag files
" Plug 'ludovicchabant/vim-gutentags', { 'commit': 'eecb136' }



" Search
" ============================================================================

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim', { 'commit': 'ae116d4' }

" A command-line fuzzy finder written in Go, and the Vim companion plugin
Plug 'junegunn/fzf', {
    \ 'commit': 'dba14d2',
    \ 'dir': '~/.fzf',
    \ 'do': './install --all',
    \ }
Plug 'junegunn/fzf.vim', { 'commit': '95f025e' }

" Improved incremental searching for Vim
Plug 'haya14busa/incsearch.vim', { 'commit': '25e2547' }

" Helps you win at grep
Plug 'mhinz/vim-grepper', { 'commit': '4a47e20' }

" Edit every line in a quickfix list at the same time
Plug 'Olical/vim-enmasse', { 'commit': 'c2286f1' }



" Version control
" ============================================================================

" Show a changes using Vim's sign column
Plug 'mhinz/vim-signify', { 'commit': 'abb1c89' }

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive', { 'commit': '21ed533' }

" An awesome git handling plugin for Vi1797333m
Plug 'lambdalisue/gina.vim', { 'commit': '6cd15a5' }




" Filetype support
" ============================================================================

" Language Server Protocol (LSP) support for vim and neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'commit': '0e5c954',
    \ 'do': 'bash install.sh',
    \ }

" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim', { 'commit': '68f8136' }

" The uncompromising Python code formatter
Plug 'python/black', { 'commit': 'a4399f3' }

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plug 'python-mode/python-mode', { 'commit': '6316b01' }

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'commit': 'b919c60' }




" Text editing
" ============================================================================

" Vim plugin that provides additional text objects
Plug 'wellle/targets.vim', { 'commit': '4a5e9c0' }

" The missing motion for Vim
Plug 'justinmk/vim-sneak', { 'commit': '7d82982' }

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align', { 'commit': '1cd724d' }

" vim match-up: even better % fist_oncoming navigate and highlight matching
"  words fist_oncoming modern matchit and matchparen replacement
Plug 'andymass/vim-matchup', { 'commit': '6836995' }

" Should stop using this plugin
" " True Sublime Text style multiple selections for Vim
" Plug 'terryma/vim-multiple-cursors', { 'commit': 'f4fd6ad' }

" Comment stuff out
Plug 'tpope/vim-commentary', { 'commit': '141d9d3' }

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat', { 'commit': '43d2678' }

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround', { 'commit': '5970688' }

" Plugin to toggle, display and navigate marks
Plug 'kshenoy/vim-signature', { 'commit': '6bc3dd1' }

" Plugin to move lines and selections up and down
Plug 'matze/vim-move', { 'commit': 'd3b0d95' }




" Writing plugins
" ============================================================================

" A powerful grammar checker for Vim using LanguageTool.
Plug 'rhysd/vim-grammarous', { 'commit': '65e01dd' }

" Uncover usage problems in your writing.
Plug 'reedes/vim-wordy', { 'commit': '14b9dbf' }

" Stop repeating yourself.
Plug 'dbmrq/vim-ditto', { 'commit': 'c21f0e2' }

" Build on Vim’s spell/thes/dict completion.
Plug 'reedes/vim-lexical', { 'commit': 'fb42333' }

" Lightweight auto-correction for Vim.
"  NOTE: am i actually using this, if not remove
Plug 'reedes/vim-litecorrect', { 'commit': '8d5f233' }

" Automatically replacing spelling mistakes and typos as you type
Plug 'sedm0784/vim-you-autocorrect', { 'commit': '6849fa9' }

" All the world's indeed a stage and we are merely players.
Plug 'junegunn/limelight.vim', { 'commit': '106fb57' }

" Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim', { 'commit': '5b8bd03' }




" Miscellaneous
" ============================================================================

" Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window
Plug 'skywind3000/asyncrun.vim', { 'commit': '17ac25c' }

" The ultimate undo history visualizer for Vim
Plug 'mbbill/undotree', { 'commit': '9172c17' }

" Fade your inactive buffers and preserve the syntax highlighting!
"  NOTE: previously disabled for high CPU usage of python3 client :(
Plug 'TaDaa/vimade', { 'commit': '1192d6f' }

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim', { 'commit': '83ae633' }

" Directory viewer for Vim
Plug 'justinmk/vim-dirvish', { 'commit': '9c0dc32' }

" Helpers for UNIX
Plug 'tpope/vim-eunuch', { 'commit': '10da325' }

" Continuously updated session files
Plug 'tpope/vim-obsession', { 'commit': '95a5762' }

" Find out which project a file belongs to, easy to use in scripts/mappings
Plug 'dbakker/vim-projectroot', { 'commit': '6878712' }

" Sane buffer/window deletion.
Plug 'mhinz/vim-sayonara', { 'commit': '357135c' }

" Colorsheme Scroller, Chooser, and Browser
Plug 'vim-scripts/ScrollColors', { 'commit': '2ce50b9' }

" Heuristically set buffer options
Plug 'tpope/vim-sleuth', { 'commit': 'ea3f065' }

" Smooth scrolling for Vim done right
Plug 'psliwka/vim-smoothie', { 'commit': 'd3de4fb' }

" Vim mapping for sorting a range of text
Plug 'christoomey/vim-sort-motion', { 'commit': '49dfca' }

" The fancy start screen for Vim
Plug 'mhinz/vim-startify', { 'commit': 'e25fbe1' }

" Jump to random Vim documentation
Plug 'mhinz/vim-randomtag', { 'commit': '5784fa1' }

" Alter Vim's appearance to suit your task & environ
Plug 'reedes/vim-thematic', { 'commit': '5bc225d' }

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine', { 'commit': '4764873' }

" Tame the quickfix window
Plug 'romainl/vim-qf', { 'commit': '87e9a7d' }




" Colorschemes
" ============================================================================

" Dark vim colorscheme based on colors from Wes Anderson films
Plug 'tlhr/anderson.vim', { 'commit': '82bfa39' }

" A dark, low-contrast, Vim colorscheme.
Plug 'romainl/Apprentice', { 'commit': '0ca2038' }

" Vim color scheme designed to be very readable in both light and dark environments.
Plug 'gregsexton/Atom', { 'commit': 'b07c601' }

" Base16 for Vim
Plug 'chriskempson/base16-vim', { 'commit': 'f6e70df' }

" A dark Vim colorscheme for color blind vimmers. But not only.
Plug 'romainl/vim-dichromatic', { 'commit': '5f24f5f' }

" Equinusocio's material theme for Neovim/Vim
Plug 'chuling/equinusocio-material.vim', { 'commit': '719608b' }

" Solarized, without the bullshit.
Plug 'romainl/flattened', { 'commit': '921777a' }

" A colorful, dark color scheme for Vim
Plug 'nanotech/jellybeans.vim', { 'commit': 'fdc7b7e' }

" Molokai color scheme for Vim
Plug 'tomasr/molokai', { 'commit': 'c67bdfc' }

" A fixed solarized colorscheme for better truecolor support.
Plug 'icymind/NeoSolarized', { 'commit': '3d18f83' }

" An arctic, north-bluish clean and elegant Vim theme
Plug 'arcticicestudio/nord-vim', { 'commit': '7be2614' }

" Oceanic Next theme for neovim
Plug 'mhartington/oceanic-next', { 'commit': '08158ee' }

" A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
Plug 'joshdick/onedark.vim', { 'commit': '7f36f83' }

" Clean, vibrant and pleasing color scheme for Vim
Plug 'sonph/onehalf', { 'commit': 'c0f08a2' }

" Light & Dark Vim color schemes inspired by Google's Material Design
Plug 'NLKNguyen/papercolor-theme', { 'commit': '0826f9d' }

" Low-contrast Vim color scheme based on Seoul Colors
Plug 'junegunn/seoul256.vim', { 'commit': 'af0f087' }

" A Vim Colorscheme
Plug 'AlessandroYorba/Sierra', { 'commit': 'c78bf67' }

" A Vim color scherafi/awesome-vim-colorschemesme loosely based on the Spacegray Xcode theme.
Plug 'ajh17/spacegray.vim', { 'commit': '79936a4' }

" A dark theme for Vim
Plug 'dracula/vim', { 'commit': 'bfbc3ca' }

" Vim adaptation of the Afterglow colorscheme
Plug 'danilo-augusto/vim-afterglow', { 'commit': 'dd529e1' }

" A dark color scheme for Vim & gVim
Plug 'w0ng/vim-hybrid', { 'commit': 'cc58baa' }

" For high readability, optimal visibility, and eye comfortable.
Plug 'zeis/vim-kolor', { 'commit': '29fd6ce' }

" Adaptation of one-light and one-dark colorschemes for Vim
Plug 'rakr/vim-one', { 'commit': '6695e13' }

" A vim/neovim colorscheme
Plug 'sts10/vim-pink-moon', { 'commit': 'd6a4b41' }

" VSCode Plastic theme port for vim/neovim
Plug 'flrnd/plastic.vim', { 'commit': '8a50b70' }

" Optimized Solarized colorschemes. Best served with true-color terminals!
Plug 'lifepillar/vim-solarized8', { 'commit': '30fd919' }

" Tomorrow Theme the precursor to Base16 Theme
Plug 'chriskempson/vim-tomorrow-theme', { 'commit': '46994f3' }

" A blend between duotone light and firewatch for atom
Plug 'rakr/vim-two-firewatch', { 'commit': 'efa0689' }

" An intergalactically friendly color scheme for Vim.
Plug 'tyrannicaltoucan/vim-deep-space', { 'commit': '126d52f' }



"" Comment here
"Plug '', { 'commit': '' }




" Late loading plugins
" ============================================================================

" A solid language pack for Vim
"  loaded late to let other plugins set things up first
Plug 'sheerun/vim-polyglot', { 'commit': '449bb88' }




" Finish, the end
" ============================================================================

" Required: initialize plugin system
call plug#end()

" TODO : seems the following actually aren't required on neovim
" Required:
"filetype plugin indent on
"syntax enable

"End vim-plug scripts-------------------------
