" TypeScript Settings
"======================================================================

" nmap <silent> tsd :TSDef<CR>
" nmap <silent> tsr :TSRefs<CR>
" nmap <silent> tst :TSType<CR>
" nmap <silent> T :TSType<CR>
" nmap <silent> tsn :TSRename<CR>

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType typescript :set makeprg=tsc\ --noEmit
