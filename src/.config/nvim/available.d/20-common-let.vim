"===============================================================================
" Let Settings
"===============================================================================

""
" Neovim/misc settings
" ==============================================================================

" Set truecolour support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Set python info to pyenv installs
let g:python_host_prog = '/home/cewood/.anyenv/envs/pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/cewood/.anyenv/envs/pyenv/versions/neovim3/bin/python'


""
" Pymode
" ==============================================================================

" TODO : are these still required?
" Fixes for pymode completion hanging
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0


""
" Fzf: [Buffers] Jump to the existing window if possible
" ==============================================================================

let g:fzf_buffers_jump = 0
let g:fzf_layout = { 'down': '~30%' }


""
" seoul256.vim: set backgrounds
" ==============================================================================

let g:seoul256_background = 233
let g:seoul256_light_background = 256


""
" Polyglot
" ==============================================================================

" Disable some languages, usually because they have clashes
let g:polyglot_disabled = ['go']


""
" Polyglot
" ==============================================================================

" Enable terraform format on save
let g:terraform_fmt_on_save=1


" To minimise CPU usage, per this Github issue:
"  https://github.com/TaDaa/vimade/issues/19#issuecomment-492214626
let g:vimade={}
let g:vimade.usecursorhold=1


""
" Vim-go config
" ==============================================================================

"let g:go_def_mapping_enabled = 0  " Don't override vim's tag mappings!!!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = "goimports"    


""
" Startify config
" ==============================================================================

let g:startify_change_to_dir = 0
let g:startify_session_dir = '/home/cewood/.config/nvim/sessions'


""
" Grepper config
" ==============================================================================

let g:grepper               = {}
let g:grepper.tools         = ['git', 'rg', 'ag', 'grep']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 1


""
" Airline config
" ==============================================================================

let g:airline_powerline_fonts = 0
" let g:airline_theme='base16_flat'
" let g:airline_theme='base16_harmonic16'
" let g:airline_theme='base16_solarized'
" let g:airline_theme='base16_spacemacs'
let g:airline_theme='cool'
" let g:airline_theme='hybrid'
" let g:airline_theme='xtermlight'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 0 " don't show buffers, only tabs
let g:airline#extensions#tabline#show_tab_type = 0 " dodn't display the tab type
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number


""
" ALE config
" ==============================================================================

"" Write this in your vimrc file
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1

let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1


""
" Markdown config
" ==============================================================================

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 0
