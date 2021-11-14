"===============================================================================
" Key Mappings
"===============================================================================

" Ctrl-Space for buffer switching
nnoremap <silent><C-Space> :Buffers<CR>

" Alt-Space for MRU file browsing
nnoremap <silent><A-Space> :History<CR>

" Shift-Alt-Space for MRU file browsing
nnoremap <silent><Shift><A-Space> :GFiles<CR>

" Shift-Ctrl-} for calling LanguageClient document hover
nnoremap <silent><C-[> :call LanguageClient#textDocument_hover()<CR>

" " Ctrl-Space for buffer switching in Denite
" nnoremap <silent><C-Space> :Denite buffer -auto-resize<CR>

" " Alt-Space for MRU file browsing in Denite
" nnoremap <silent><A-Space> :Denite file/old -auto-resize<CR>

" " Alt-Space for MRU file browsing in Denite
" nnoremap <silent><leader><A-Space> :DeniteProjectDir file/rec -auto-resize<CR>

" " Define mappings for Denite
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"         \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> d
"         \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"         \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> q
"         \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i
"         \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <Space>
"         \ denite#do_map('toggle_select').'j'
" endfunction

" Change local/window directory to that of current file
nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>

" Undo the ctags related bindings that vim-go and others override
silent! unmap <buffer> <c-]>
silent! unmap <buffer> <c-t>

" " Remap leader key to ,
" let mapleader=","
" let g:mapleader=","

"" Ctrl-v: Paste (works with system clipboard due to clipboard setting earlier)
"nnoremap <c-v> p

" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
vnoremap <c-c> y`]

" EasyAlign mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" vim-grepper mapping for motions
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>G :Grepper -tool rg -buffers<cr>

"" https://medium.com/@schtoeffel/ycu-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
