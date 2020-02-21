" The nvim_typescript Plugin
"======================================================================
" @see: https://github.com/mhartington/nvim-typescript/issues/256
let g:nvim_typescript#diagnostics_enable=0

let g:nvim_typescript#quiet_startup = 1

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType typescript :set makeprg=tsc\ --noEmit
