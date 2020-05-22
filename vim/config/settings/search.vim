" Searching, completion and folds
"======================================================================

set ignorecase
set smartcase
set hlsearch
set showmatch
set wrapscan
set gdefault

" set gdefault
" set incsearch

set wildmode=list:longest,list:full
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildmenu

" better folding
set foldignore=
set foldmethod=manual " indent folding
set foldnestmax=20    " max 20 levels of folding
" set nofoldenable      " dont fold by default - let me do it
set foldlevelstart=1  " deactivate folding on fileload
