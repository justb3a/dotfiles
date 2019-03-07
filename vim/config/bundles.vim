" All bundles, syntaxes and plugins
"======================================================================

call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

call dein#add('Shougo/deoplete.nvim')             " autocomplete asynchronous
call dein#add('carlitux/deoplete-ternjs', {
    \ 'build': {
    \     'mac': 'npm install -g tern',
    \     'unix': 'npm install -g tern' }
    \ } )                                         " autocomplete javascript
call dein#add('justb3a/vim-smarties')             " color scheme
call dein#add('scrooloose/nerdtree')              " file tree
call dein#add('tpope/vim-fugitive')               " git for vim
call dein#add('Raimondi/delimitMate')             " helper: automatic closing of brackets etc.
call dein#add('tpope/vim-abolish')                " helper: abbreviation, substitution, coercion
call dein#add('dhruvasagar/vim-table-mode')       " helper: table mode
call dein#add('tpope/vim-commentary')             " helper: commenting out
call dein#add('tpope/vim-ragtag')                 " helper: set of mappings
call dein#add('tpope/vim-unimpaired')             " helper: mappings, identation
call dein#add('editorconfig/editorconfig-vim')    " helper: respect editor config
call dein#add('rking/ag.vim')                     " search
call dein#add('junegunn/fzf.vim')                 " search: fuzzy finding
call dein#add('haya14busa/incsearch.vim')         " search: highlights ALL pattern matches
call dein#add('Shougo/neosnippet')                " snippets
call dein#add('justb3a/vim-snippets')             " snippets: vim
call dein#add('w0rp/ale')                         " syntax: linting asynchronous
call dein#add('sheerun/vim-polyglot')             " syntax: collection of language packs
call dein#add('itchyny/lightline.vim')            " statusbar
call dein#add('christoomey/vim-tmux-navigator')   " tmux support
