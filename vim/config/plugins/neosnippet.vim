" Neosnippet config
"======================================================================

let g:neosnippet#disable_runtime_snippets = { "_": 1 }
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['scss'] = 'scss,css'
let g:neosnippet#scope_aliases['php'] = 'php,html'
let g:neosnippet#scope_aliases['markdown'] = 'txt'
let g:neosnippet#snippets_directory = '~/.vim/dein/repos/github.com/justb3a/vim-snippets/snippets'


" Plugin key-mappings, expand with ctrl + j
imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)


" Neosnippet - SuperTab like snippets behavior.
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: "\<TAB>"
