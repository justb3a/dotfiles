"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler          " show where you are in the document
set cursorline     " highligh current line
set ttyfast        " faster terminal usage
set showcmd        " show me what im doing. helps alot
set showmode       " show active mode
set hidden         " allows for switching buffers without writing
" set number " relative line numbers are mothereffin awesome -- see how far your commands will go

set nowrap         " dont wrap lines around
set sidescroll=10  " smoother side-scrolling
set sidescrolloff=5
set scrolljump=5   " Lines to scroll when cursor leaves screen
set scrolloff=3    " Minimum lines to keep above and below cursor
set ttyscroll=3    " faster terminal scrolling
