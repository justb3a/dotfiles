" All bundles, syntaxes and plugins
"======================================================================

call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet')
call dein#add('cakebaker/scss-syntax.vim')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('gcorne/vim-sass-lint')
call dein#add('haya14busa/incsearch.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('justinmk/vim-sneak')
call dein#add('kien/ctrlp.vim')
call dein#add('justb3a/vim-smarties')
call dein#add('justb3a/vim-snippets')
call dein#add('mattn/emmet-vim')
call dein#add('moll/vim-node')
call dein#add('mtscout6/syntastic-local-eslint.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('Raimondi/delimitMate')
call dein#add('rking/ag.vim')
call dein#add('sheerun/vim-polyglot')
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-ragtag')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-markdown')
