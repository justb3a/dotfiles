" Default sane config
"======================================================================

filetype plugin indent on
syntax on

set autoread                     " Automatically read a file that has changed on disk
set backspace=indent,eol,start   " Allow backspacing over everything in insert mode
set clipboard=unnamed            " pasting and copying osx + tmux fix
set cursorline                   " highlight current line
set encoding=utf-8               " Yeah. UTF-8 FTW!
set grepprg=ag                   " use ag for grepping
set hidden                       " allows for switching buffers without writing
set lazyredraw                   " Don't redraw while executing macros
set linebreak                    " Break long lines by word, not char
set mouse=a                      " mouse for scrolling
set nobackup                     " no backups
set noerrorbells                 " don't beep
" set noesckeys                    " no delay for escaping
" set noshowmode                   " dont show active mode
" set showmode                     " show active mode
set noswapfile                   " no swp-files
set nowrap                       " dont wrap lines around
set nowritebackup                " no stupid backup files
set number                       " show current line numer
set pastetoggle=<F2>             " toggle paste-mode for c&p with F2
set relativenumber               " relative line numbers are mothereffin awesome -- see how far your commands will go
set ruler                        " show where you are in the document
set scrolljump=5                 " Lines to scroll when cursor leaves screen
set scrolloff=3                  " Minimum lines to keep above and below cursor
set showcmd                      " show me what im doing. helps a lot
set sidescroll=10                " smoother side-scrolling
set sidescrolloff=5              " jump by 5 when scrolling sideways
set timeout ttimeoutlen=100      " get rid of the delay when pressing O (for example)
" set ttyfast                      " faster terminal usage
" set ttymouse=xterm2              " xterm/tmux compatible mouse
" set ttyscroll=3                  " faster terminal scrolling
set virtualedit=all              " every mode active from v V to StrgV
set visualbell                   " don't flicker
" set complete-=i                  " dont complete from files
set nrformats-=octal             " nobody uses octal anyway
set display+=lastline            " shorten long lastlines
set formatoptions+=j             " Delete comment character when joining commented lines

" Maximum column in which to search for syntax items.
" In long lines the text after this column is not highlighted and following lines may not be highlighted correctly
" Set to zero to remove the limit
set synmaxcol=500

" deactivate syntax highlighting when diffing
if &diff
  syntax off
endif
