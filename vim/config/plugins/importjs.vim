" The js-import Plugin
"======================================================================
" nmap <silent> <leader><CR> :ImportJSWord<CR> <bar> :call timer_start(500, {tid -> execute(':ALEFix')})<CR>
" nmap <silent> <leader><Tab> :ImportJSFix<CR> <bar> :call timer_start(500, {tid -> execute(':ALEFix')})<CR>
nmap <silent> <leader><CR> :ImportJSWord<CR>
nmap <silent> <leader><Tab> :ImportJSFix<CR>

" nmap <silent> <leader><Space> :exec ImportAndLint()<CR>
" function ImportAndLint()
"   :ImportJSWord
"   :call timer_start(3000, { tid -> execute(':ALEFix')})
" endfunction
