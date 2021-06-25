" take me to your leader!
"======================================================================

let g:mapleader = ","
let g:maplocalleader = ","

" open new vertical split and change to split
nnoremap <leader>, <C-w>v<C-w>l
nnoremap <leader>- <C-w>s<C-w>j

" edit existing file under cursor
nnoremap <leader>g gf
" edit existing file under cursor in vertical split
nnoremap <leader>g- <C-w>f
" edit existing file under cursor in horizontal split
nnoremap <leader>g, :vertical wincmd f<CR>

" Adjust viewports/splits to equal widths/heights
nnoremap <leader>= <C-w>=
nnoremap <leader>h 40<C-w>>
nnoremap <leader>j 20<C-w>+
nnoremap <leader>k 20<C-w>-
nnoremap <leader>l 40<C-w><

" open a new split and edit the vimrc // easy sourcing vimrc
nnoremap <leader>ve <C-w>v<C-w>l :e ~/.vimrc<cr>
nnoremap <leader>vs :source ~/.vimrc<cr>

" Opens an edit command with the path of the currently edited file filled in
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Yank to clipboard with clipper -- see https://github.com/wincent/clipper
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

" Find merge conflict markers
nnoremap <leader>gf /\v^[<\|=>]{7}( .*\|$)<CR>

" paste keeping indentation
nnoremap <leader>p p`[v`]=

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>Y "*Y

" toggle wrapping
nnoremap <leader>w :set wrap! wrap?<CR>

" fix wrong indentation
" nnoremap <leader>i :set autoindent noexpandtab tabstop=2 shiftwidth=2
