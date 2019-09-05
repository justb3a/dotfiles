" The Vim-Prettier Plugin
"======================================================================

" use own config as default, but allows .editorconfig, .prettierrc, etc. to override it
let g:prettier#config#config_precedence = 'file-override'

" disable auto formatting
let g:prettier#autoformat = 0

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print semicolons
" autocmd FileType js, ts, jsx let g:prettier#config#semi = 'false'
let g:prettier#config#semi = 'false'

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
