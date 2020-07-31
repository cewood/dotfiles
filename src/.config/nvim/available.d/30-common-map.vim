"===============================================================================
" Key Mappings
"===============================================================================

" Ctrl-Space for buffer switching in Denite
nnoremap <silent><C-Space> :Denite buffer -auto-resize<CR>

" Alt-Space for MRU file browsing in Denite
nnoremap <silent><A-Space> :Denite file_old -auto-resize<CR>

" Alt-Space for MRU file browsing in Denite
nnoremap <silent><leader><A-Space> :DeniteProjectDir file/rec -auto-resize<CR>

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

"" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
" https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
