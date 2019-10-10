" The Ale Plugin
"======================================================================
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 0
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'html': [],
\   'typescript': ['tsserver', 'tslint', 'eslint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint']
\}

" navigate between errors quickly
nmap <silent> <leader>8 <Plug>(ale_next_wrap)
nmap <silent> <leader>9 <Plug>(ale_previous_wrap)
