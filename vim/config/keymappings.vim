" Custom key mappings and shortcuts ======================================================================

" remap semi-colon to be colon in normal an visual mode
nnoremap ; :
vnoremap ; :

" Swap v and CTRL-V, because Block mode is more useful
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

" jk nice behaviour (screen lines vs. shown lines)
nnoremap j gj
nnoremap k gk

" behave - yank just like D and C
nnoremap Y y$

" auto-yanking with clipper for selected yanking, see leader-y mapping
" vnoremap y y :call system('nc localhost 8377', @0)<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap N Nzz
nnoremap n nzz

" dont use the arrow keys in insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" use the arrowkeys for usefull stuff in normal mode -- switching buffers
nnoremap <Up> :bfirst<cr>
nnoremap <Down> :blast<cr>
nnoremap <Left> :bp<cr>
nnoremap <Right> :bn<cr>

" Bubble/indent lines using unimpaired
" for mapping ALT+hjkl, use instead the real character generated
" k ∆  up / j º  down / l @ right / h ª left
" terminal > profiles > Keyboard
" S-Up: \033[1;2A | S-Down: \033[1;2A | S-Right: \033[1;2C | S-Left: \033[1;2D
nmap <S-Up> [e
vmap <S-Up> [egv

nmap <S-Down> ]e
vmap <S-Down> ]egv

nmap <S-left> <<
vmap <S-left> <gv
imap <S-left> <Esc><<i

" to not map ALT+L because it's needed to execute a makro (@q)
nmap <S-right> >>
vmap <S-right> >gv
imap <S-right> <Esc>>>i

" Fast Switch between windows/buffers with tab
nnoremap <tab> <C-w><C-w>
nnoremap <S-tab> <C-w>W

" no help while mishitting ESC - awesome
noremap <F1> <ESC>

" hitting jj in insert mode escapes
inoremap jj <ESC>

" deactivate stupid ex-mode and man-page stuff
nnoremap Q <nop>
nnoremap K <nop>

" reload files when set autoread is active with F5
nnoremap <F5> :checktime<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" just insert slash to start searching
nnoremap / /\v
vnoremap / /\v

" increase number, default tmux
nnoremap <C-Y> <C-A>

" auto-yanking with clipper for selected yanking, see leader-y mapping
vnoremap y y :call system('nc localhost 8377', @0)<cr>

" fix missing syntax highlighting
nnoremap <silent> <C-l> :nohlsearch<CR>:setl nolist nospell<CR>:diffupdate<CR>:syntax sync fromstart<CR><C-l>
