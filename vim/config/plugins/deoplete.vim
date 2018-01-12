" deoplete
"======================================================================
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
let g:deoplete#auto_complete_delay=150
let g:deoplete#auto_completion_start_length=3

inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-l> deoplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>deoplete_cr_function()<CR>
inoremap <expr><C-y> deoplete#close_popup()

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

function! s:deoplete_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction
