" The Vim-Prettier Plugin
"======================================================================

" use own config as default, but allows .editorconfig, .prettierrc, etc. to override it
let g:prettier#config#config_precedence = 'file-override'

" disable auto formatting
let g:prettier#autoformat = 0

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" max line length that prettier will wrap on
let g:prettier#config#print_width = 120

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" enforce trailing comma
let g:prettier#config#trailing_comma = 'all'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'

" enforce asynchronous execution
let g:prettier#exec_cmd_async = 1

" print semicolons
autocmd FileType js,ts,jsx,tsx,mdx let g:prettier#config#semi = 'false'

let g:prettier#exec_cmd_path = "~/.vim/dein/repos/github.com/prettier/vim-prettier/node_modules/prettier"

" trigger async formatting
autocmd BufWritePre *.js,*.jsx,*.mjs,*.mdx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.gql,*.vue,*.yaml,*.html Prettier

" one-off bypassing of Prettier
command! W noautocmd w
