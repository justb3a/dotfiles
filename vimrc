" my vimrc - this file basically initalies dein.vim and loads
" other config files from vim/config + the plugins-subfolder
"======================================================================

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim
endif

call dein#begin(expand('~/.vim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')

" Let dein.vim handle the rest, and start by loading bundles and
source ~/.vim/config/bundles.vim

" end dein.vim config
call dein#end()

" load the default config and mappings
source ~/.vim/config/defaultconfig.vim
source ~/.vim/config/search.vim
source ~/.vim/config/whitespace.vim
source ~/.vim/config/autocommands.vim
source ~/.vim/config/gui.vim
source ~/.vim/config/colorscheme.vim
source ~/.vim/config/keymappings.vim
source ~/.vim/config/leaderkeys.vim

" and the configs and mappings for plugins loaded in bundles.vim
source ~/.vim/config/plugins/ag.vim
source ~/.vim/config/plugins/commentary.vim
source ~/.vim/config/plugins/ctrlp.vim
source ~/.vim/config/plugins/emmet.vim
source ~/.vim/config/plugins/fugitive.vim
source ~/.vim/config/plugins/incsearch.vim
source ~/.vim/config/plugins/lightline.vim
source ~/.vim/config/plugins/nerdtree.vim
source ~/.vim/config/plugins/neocomplete.vim
source ~/.vim/config/plugins/neosnippet.vim
source ~/.vim/config/plugins/syntastic.vim
source ~/.vim/config/plugins/sneak.vim
source ~/.vim/config/plugins/tablemode.vim
