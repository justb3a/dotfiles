" All bundles, syntaxes and plugins
"======================================================================

call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

" @see: https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources

" BASIC
call dein#add('justb3a/vim-smarties')                                          " color scheme
call dein#add('scrooloose/nerdtree')                                           " file tree
call dein#add('tpope/vim-fugitive')                                            " git for vim
call dein#add('itchyny/lightline.vim')                                         " statusbar
call dein#add('christoomey/vim-tmux-navigator')                                " tmux support

" AUTOCOMPLETE / LINTING
call dein#add('Shougo/deoplete.nvim')                                          " autocomplete asynchronous
call dein#add('w0rp/ale')                                                      " syntax: linting asynchronous
call dein#add('maximbaz/lightline-ale')                                        " ale (error, warnings) indicator for lightline
call dein#add('sheerun/vim-polyglot')                                          " syntax: collection of language packs

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

" PHP
" call dein#add('lvht/phpcd.vim', {'on_ft': 'php', 'build': 'composer install'}) " autocomplete php // composer install

" JAVASCRIPT
call dein#add('carlitux/deoplete-ternjs')                                      " autocomplete javascript // npm install -g tern
call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})        " language service plugin for typescript

" SCALA
"call dein#add('ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' })           " autocomplete scala / java
"call dein#add('derekwyatt/vim-scala')                                          " syntax checking, autocomplete scala

" GO
"call dein#add('fatih/vim-go', { 'do': ':GoUpdateBinaries' })                   " GoInstallBinaries
"call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})               " autocomplete GO
"call dein#add('stamblerre/gocode', { 'rtp': 'nvim/' })                         " go get -u github.com/stamblerre/gocod
