" The Ale Plugin
"======================================================================
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_linters = {
\   'html': [],
\   'typescript': ['tsserver', 'tslint'],
\}

" navigate between errors quickly
nmap <silent> <leader>8 <Plug>(ale_next_wrap)
nmap <silent> <leader>9 <Plug>(ale_previous_wrap)

let g:ale_completion_enabled = 0
