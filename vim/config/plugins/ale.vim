" The Ale Plugin
"======================================================================
let g:ale_sign_column_always = 1
let g:ale_completion_enabled = 0
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'html': [],
\   'typescript': ['tsserver', 'eslint'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint', 'importjs'],
\  'typescript': ['eslint', 'importjs']
\}

let g:ale_pattern_options = {
\ 'unite-front': { 'ale_javascript_eslint_options': '--rulesdir  ~/Projects/mercateo/unite-front/packages/eslint-rules/lib/rules' }
\}

" navigate between errors quickly
nmap <silent> <leader>N <Plug>(ale_next_wrap)
nmap <silent> <leader>P <Plug>(ale_previous_wrap)
