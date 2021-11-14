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
let g:pymode_rope = 1


""
" Fzf
" ==============================================================================

let g:fzf_buffers_jump = 1

" " This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" " An action can be a reference to a function that processes selected lines
" function! s:build_quickfix_list(lines)
"   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"   copen
"   cc
" endfunction

" let g:fzf_action = {
"   \ 'ctrl-q': function('s:build_quickfix_list'),
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" " Default fzf layout
" " - Popup window (center of the screen)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" " Enable per-command history
" " - History files will be stored in the specified directory
" " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
" "   'previous-history' instead of 'down' and 'up'.
" let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']


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

" let g:airline_powerline_fonts = 0
" " let g:airline_theme='base16_flat'
" " let g:airline_theme='base16_harmonic16'
" " let g:airline_theme='base16_solarized'
" " let g:airline_theme='base16_spacemacs'
" let g:airline_theme='cool'
" " let g:airline_theme='hybrid'
" " let g:airline_theme='xtermlight'

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#show_splits = 1
" let g:airline#extensions#tabline#show_buffers = 0 " don't show buffers, only tabs
" let g:airline#extensions#tabline#show_tab_type = 0 " dodn't display the tab type
" let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number


""
" Lightline config
" ==============================================================================

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename'
      \ }
      \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction

" function! LightlineFilename()
"   return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"         \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"         \  &ft == 'unite' ? unite#get_status_string() :
"         \  &ft == 'vimshell' ? vimshell#get_status_string() :
"         \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"         \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
" endfunction

function! LightlineFilename()
  " Adapted from this GitHub issue(s)...
  "   https://github.com/itchyny/lightline.vim/issues/172#issuecomment-236194881
  "   https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
  "   https://github.com/tpope/vim-fugitive/issues/1200
  "
  let fullname = expand('%')
  let gitversion = ''
  if fullname =~? 'fugitive://.*/\.git//0/.*'
      let gitversion = ' - GIT INDEX //0'
  elseif fullname =~? 'fugitive://.*/\.git//2/.*'
      let gitversion = ' - GIT TARGET //2'
  elseif fullname =~? 'fugitive://.*/\.git//3/.*'
      let gitversion = ' - GIT MERGE //3'
  endif

  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != gitversion ? gitversion : '') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    return fugitive#head()
  endif
  return ''
endfunction


""
" ALE config
" ==============================================================================

" " Write this in your vimrc file
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" "let g:ale_open_list = 1

" " Set this if you want to.
" " This can be useful if you are combining ALE with
" " some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1

" let g:ale_set_balloons = 1
" let g:ale_virtualtext_cursor = 1
" let g:ale_cursor_detail = 1


""
" Markdown config
" ==============================================================================

let g:tex_conceal = ""
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 0
let g:vim_markdown_new_list_item_indent = 0


""
" LanguageClient-neovim config
" ==============================================================================

let g:LanguageClient_serverCommands = {
   \ 'rust': ['rust-analyzer'],
   \ 'go': ['gopls']
   \ }
