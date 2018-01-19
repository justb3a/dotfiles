" gui options for macvim / gvim
"======================================================================

if has('gui_running')
  set guifont=Fira\ Code:h12 " a nice font here
  set linespace=0     " hack is nice, but very wide...
  " set guifont=Menlo\ for\ Powerline:h12 " a nice font here
  " set linespace=1    " menlo is nice, but very dense...
  set guioptions-=T    " no toolbar
  set guioptions-=L    " no left scrollbar
  set guioptions-=r    " no right scrollbar
endif

" set guicursor=
au VimLeave * set guicursor=a:ver10-blinkon0"
