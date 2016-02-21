" nocompatible mode for a real vim
set nocompatible

" switch filetype of before starting vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" load the vundle bundle of course
Bundle 'gmarik/vundle'

" plugins
Bundle 'Raimondi/delimitMate'
Bundle 'bling/vim-airline'
Bundle 'chrisbra/NrrwRgn'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'edsono/vim-matchit'
Bundle 'godlygeek/tabular'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'kshenoy/vim-signature'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mbbill/undotree'
Bundle 'mhinz/vim-signify'
Bundle 'rizzatti/dash.vim'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'terryma/vim-expand-region'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
" Bundle 'Rykka/riv.vim'
Bundle 'vim-scripts/Unicode-RST-Tables'
" Bundle 'justonestep/vim-rename'
" Bundle 'justonestep/vim-remove'
Bundle 'christoomey/vim-tmux-navigator'

" Completions
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
" Bundle 'vim-scripts/AutoComplPop'
" Bundle 'ervandew/supertab'
" Bundle 'SirVer/ultisnips'

" Additional syntaxes
Bundle 'beyondwords/vim-twig'
Bundle 'elzr/vim-json'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'juvenn/mustache.vim'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'webgefrickel/vim-typoscript'
Bundle 'joshtronic/php.vim'
Bundle 'evanmiller/nginx-vim-syntax'
" Bundle 'spf13/PIV'
"
" Color themes -- one to rule them all!
Bundle 'justonestep/jellybeans.vim'

" and reset auto-filetype after loading all bundles
filetype plugin indent on
syntax on

set ruler          " show where you are in the document
set cursorline     " highligh current line
set ttyfast        " faster terminal usage
set showcmd        " show me what im doing. helps alot
set showmode       " show active mode
set hidden         " allows for switching buffers without writing
set relativenumber " relative line numbers are mothereffin awesome -- see how far your commands will go

set nowrap         " dont wrap lines around
set sidescroll=10  " smoother side-scrolling
set sidescrolloff=5
set scrolljump=5   " Lines to scroll when cursor leaves screen
set scrolloff=3    " Minimum lines to keep above and below cursor
set ttyscroll=3    " faster terminal scrolling


set lazyredraw " Don't redraw while executing macros

" nice Whitespace chars
set list!
set listchars=extends:»,precedes:«,tab:▸\ ,trail:·
" set listchars=extends:»,precedes:«,tab:▸\ ,eol:¬,trail:·

" Tabs and Whitespace
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround
set smarttab
set autoindent

" use the mouse for scrolling, yeah
set mouse=a

" use ag for grepping
set grepprg=ag

" no delay for escaping
set noesckeys

" gui options for macvim
if has('gui_running')
  set guifont=Menlo\ for\ Powerline:h12 " a nice font here
  set linespace=1    " menlo is nice, but very dense...
  set guioptions-=T  " no toolbar
  set guioptions-=L  " no left scrollbar
  set guioptions-=r  " no right scrollbar
endif

" mac terminal-vim play nicely with tmux
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  " map <Esc>[B <Down>
endif


set t_Co=256
set background=dark
color jellybeans

" minor optical fix vor vim-gitgutter / syntastic / vim-signature
highlight SignColumn ctermbg=8

set fillchars=""

" Automatically read a file that has changed on disk
set autoread

set encoding=utf-8    " Yeah. UTF-8 FTW!
set fileformat=unix

set virtualedit=all  " every mode active from v V to StrgV

" always put a status line in and make the command line 2 lines high
set laststatus=2
set ch=2

" Add a $ to the end of a selection vor easier overwriting vizualisation
set cpo+=$

" 2 spaces after a sentence for easier text manupulation
set cpo+=J

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrapscan            " set the search scan to wrap lines
set backspace=indent,eol,start " Allow backspacing over everything in insert mode

" Tab completion, and ignore some filetypes
set wildmode=list:longest,list:full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store
set wildmenu

set nobackup            " no backups
set nowritebackup
set noswapfile          " no swp-files

" Better folding
set foldmethod=indent
setlocal foldignore=
set foldnestmax=20      " max 20 levels of folding
set nofoldenable        " dont fold by default - let me do it
set foldlevelstart=1    " deactivate folding on fileload

set noerrorbells        " don't beep
set visualbell          " don't beep

" pasting and copying
set pastetoggle=<F2> " toggle paste-mode for c&p with F2
set clipboard=unnamed " osx + tmux fix

 " get rid of the delay when pressing O (for example)
set timeout timeoutlen=800 ttimeoutlen=100


" Custom key mappings and shortcuts
" ======================================================================

" set the leader to comma , and ; == : -- faster commands
let mapleader = ","
nnoremap ; :
vnoremap ; :

" increase number, default tmux
nnoremap <C-Y> <C-A>

" Swap v and CTRL-V, because Block mode is more useful
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

" jk nice behaviour (screen lines vs. shown lines)
nnoremap j gj
nnoremap k gk

" benhave - yank just like D and C
nnoremap Y y$

nnoremap / /\v
vnoremap / /\v

inoremap jj <Esc>

" Switch between windows
nnoremap <tab> <C-w><C-w>
nnoremap <S-tab> <C-w>W

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

" Adjust viewports to the same size
nnoremap <leader>= <C-w>=

" reset search
nnoremap <leader><space> :noh<cr>

" open new vertical split and change to split
nnoremap <leader>, <C-w>v<C-w>l
nnoremap <leader>- <C-w>s<C-w>j

" open a new split and edit the vimrc // easy sourcing vimrc
nnoremap <leader>ve <C-w>v<C-w>l :e ~/.vimrc<cr>
nnoremap <leader>vs :source ~/.vimrc<cr>

" open a new split and edit snippets
" nnoremap <leader>se <C-w>v<C-w>l :e ~/Documents/01_snippets<cr>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" start a new document-wide seach-replace
nnoremap <leader>f :%s/

" dont use the arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" but use them for usefull stuff in normal mode-- switching buffers
nnoremap <up> :bfirst<cr>
nnoremap <down> :blast<cr>
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>

" Bubble/indent lines using unimpaired
nmap <S-up> [e
nmap <S-down> ]e
vmap <S-up> [egv
vmap <S-down> ]egv

" Move line(s) using j k
nnoremap <leader>mj :m'>+<CR>==
nnoremap <leader>mk :m-2<CR>==

" in/outdent Keymappings
nmap <S-left> <<
nmap <S-right> >>
imap <S-left> <Esc><<i
imap <S-right> <Esc>>>i
vmap <S-left> <gv
vmap <S-right> >gv

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>Y "*Y
" paste keeping indentation
nnoremap <leader>p p`[v`]=


" no HELP while mishitting ESC - awesome
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" deactivate stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Swap two words
nmap <leader>sw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" change working directory to current file
nnoremap <leader>w :cd %:p:h<CR>:pwd<CR>

" reload files when set autoread is active with F5
lnoremap <F5> :checktime<CR>

" when over a class in html hit fc to find that class in css/scss/js
nnoremap <leader>c :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cnext<CR>

" short command to strip trainling whitepsace
nnoremap <leader>s ms:%s/\s\+$//e<cr>:noh<cr>`s

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" For when you forget to sudo.. Really Write the file.
" cmap w!! w !sudo tee % >/dev/null
noremap <Leader>W :w !sudo tee % > /dev/null

" Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>j [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Plugins
" ======================================================================
"
" Ag
nnoremap <leader>a :Ag!<space>
nnoremap <leader>A :Ag! <C-r><C-w><cr>

" NERDtree
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>o :NERDTreeFind<cr>
let NERDTreeChDirMode=2
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1


" fugitive shortcuts (20+ increases window-height)
nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
nnoremap <silent> <leader>gd :Gdiff<CR><C-w>20+
nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
nnoremap <silent> <leader>gb :Gblame<CR><C-w>20+
nnoremap <silent> <leader>gl :Glog<CR><C-w>20+
nnoremap <silent> <leader>gp :Git push<CR><C-w>20+
nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+


" Undotree
nnoremap <F3> :UndotreeToggle<cr>


" TComment
nnoremap <leader>. :TComment<CR>
vnoremap <leader>. :TComment<CR>
inoremap <leader>. <Esc>:TComment<CR>i


" Tabularize
nmap <Leader>s= :Tabularize /=<CR>
vmap <Leader>s= :Tabularize /=<CR>
nmap <Leader>s{ :Tabularize /{<CR>
vmap <Leader>s{ :Tabularize /{<CR>
nmap <Leader>s: :Tabularize /:<CR>
vmap <Leader>s: :Tabularize /:<CR>
nmap <Leader>s, :Tabularize /,<CR>
vmap <Leader>s, :Tabularize /,<CR>
nmap <Leader>s<Bar> :Tabularize /<Bar><CR>
vmap <Leader>s<Bar> :Tabularize /<Bar><CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" vim sneak
let g:sneak#use_ic_scs = 1
let g:sneak#map_netrw = 0
let g:sneak#streak = 1
nmap <Bslash> <Plug>SneakNext
nmap \| <Plug>SneakPrevious
xmap <Bslash> <Plug>VSneakNext
xmap \| <Plug>VSneakPrevious


" ultisnips
" let g:UltiSnipsSnippetDirectories = ["snippets"]


" Syntastic
" no checking for xhtml/html -- because of fluidtemplate for TYPO3
" and no checking for scss.css because of CSS3 and SASS-Variable
let g:syntastic_auto_jump = 0
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['ruby', 'php', 'javascript'],
  \ 'passive_filetypes': ['xhtml', 'html', 'scss', 'scss.css', 'css']
  \ }
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']


" CtrlP (using Ag)
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPMRU<cr>
let g:ctrlp_map = '<leader>t'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 0 " easier split screens
let g:ctrlp_working_path_mode = 0 " dont try to change my working directory
let g:ctrlp_max_height = 12


" Gist filetype-detection
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1


" airline config
let g:airline_theme = 'solarized'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'


" Mac Dash.app integration
nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader>D <Plug>DashGlobalSearch
let g:dash_map = {
  \ 'javascript' : 'jquery'
  \ }


" php syntax stuff
let g:DisableAutoPHPFolding = 1


" Other functions / Onload, Autocommands
" ======================================================================

" spell correction on text-files
autocmd BufRead,BufNewFile *.{md|rst|txt} setlocal spell

" add the dash to keywords -- makes better css/js/html search
" do this for specific files only (not in php/rb e.g.)
au BufNewFile,BufRead *.{json,js,css,scss,html} set iskeyword+=-
au BufNewFile,BufRead *.{json,js,css,scss,html} set iskeyword+=_


" Syntaxes for other files
au BufNewFile,BufRead Phakefile set ft=php
au BufNewFile,BufRead *.module set ft=php
au BufNewFile,BufRead *.install set ft=php
au BufNewFile,BufRead *.twig set ft=html.twig
au BufNewFile,BufRead *.txt set ft=typoscript

" Remember last location/cursor in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" ========== On Save ==========
" A function for stripping Whitespace when saving
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Don't strip whitespace for files like md,txt or csv/sql - define files here
au BufWritePre *.{php,html,scss,css,js,ts,xml,json,inc,vim,rb} :call <SID>StripTrailingWhitespaces()

" omnicompletion for some filetypes
au FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,php,twig setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType php setlocal omnifunc=phpcomplete#CompletePHP

" NEOCOMPLETE
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_function()<CR>

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

function! s:neocomplete_cr_function()
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  " let g:neocomplete#sources#omni#input_patterns.javascript = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
endif

" NEOSNIPPET
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" " riv ignore tab in insert mode
" let g:riv_ignored_nmaps = '<Tab>,<S-Tab>'
" " let g:riv_ignored_nmaps = '<S-up>,<S-down>'
" " let g:riv_ignored_vmaps = '<S-up>,<S-down>'
" " let g:riv_fold_auto_update = 0
" " let g:riv_fold_level = 1
" let g:riv_disable_folding = 1
" " let g:riv_auto_fold_force = 0
