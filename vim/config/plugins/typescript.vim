" The nvim_typescript Plugin
"======================================================================
" @see: https://github.com/mhartington/nvim-typescript/issues/256
let g:nvim_typescript#diagnostics_enable=0

let g:nvim_typescript#quiet_startup = 1

nmap <silent> tsd :TSDef<CR>
nmap <silent> tsr :TSRefs<CR>
nmap <silent> tst :TSType<CR>
nmap <silent> T :TSType<CR>
nmap <silent> tsn :TSRename<CR>

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType typescript :set makeprg=tsc\ --noEmit
