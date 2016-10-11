" The Commentary Plugin
"======================================================================

autocmd FileType php setlocal commentstring=//\ %s

nnoremap <leader>. :Commentary<CR>
vnoremap <leader>. :Commentary<CR>
inoremap <leader>. <Esc>:Commentary<CR>i
