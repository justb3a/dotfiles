" All bundles
"======================================================================

" BASIC
call dein#add('justb3a/vim-smarties')                                          " color scheme
call dein#add('scrooloose/nerdtree')                                           " file tree
call dein#add('itchyny/lightline.vim')                                         " statusbar
call dein#add('christoomey/vim-tmux-navigator')                                " tmux support

" GIT
call dein#add('tpope/vim-fugitive')                                            " git for vim
call dein#add('airblade/vim-gitgutter')                                        " show git diff in the gutter

" AUTOCOMPLETE / LINTING
" " @see: https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
call dein#add('Shougo/deoplete.nvim')                                          " autocomplete asynchronous
call dein#add('sheerun/vim-polyglot')                                          " syntax: collection of language packs
call dein#add('Galooshi/vim-import-js')                                        " syntax: simplify importing JS modules
call dein#add('dense-analysis/ale')                                            " syntax: linting asynchronous
call dein#add('maximbaz/lightline-ale')                                        " ale indicator for lightline

" HELPER
call dein#add('Raimondi/delimitMate')                                          " helper: automatic closing of brackets etc.
call dein#add('tpope/vim-abolish')                                             " helper: abbreviation, substitution, coercion
call dein#add('dhruvasagar/vim-table-mode')                                    " helper: table mode
call dein#add('tpope/vim-commentary')                                          " helper: commenting out
call dein#add('tpope/vim-ragtag')                                              " helper: set of mappings
call dein#add('tpope/vim-unimpaired')                                          " helper: mappings, identation
call dein#add('editorconfig/editorconfig-vim')                                 " helper: respect editor config
call dein#add('Shougo/neosnippet')                                             " snippets
call dein#add('justb3a/vim-snippets')                                          " snippets: vim

" SEARCH
call dein#add('rking/ag.vim')                                                  " search
call dein#add('junegunn/fzf.vim')                                              " search: fuzzy finding
call dein#add('haya14busa/incsearch.vim')                                      " search: highlights ALL pattern matches

" === LANGUAGES ===

" CSS
call dein#add('gko/vim-coloresque')

" JAVASCRIPT
call dein#add('carlitux/deoplete-ternjs')                                      " autocomplete javascript // npm install -g tern
call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})        " language service plugin for typescript
" call dein#add('HerringtonDarkholme/yats.vim')                                  " typescript syntax highlighting

call dein#add('prettier/vim-prettier', {
    \ 'build': 'yarn install',
    \ 'branch': 'release/1.x',
    \ })                                                                       " code formatter

