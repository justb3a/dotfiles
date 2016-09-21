" The CtrlP Plugin (Using Ag)
"======================================================================
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPMRU<cr>
let g:ctrlp_map = '<leader>t'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 0 " easier split screens
let g:ctrlp_working_path_mode = 0 " dont try to change my working directory
let g:ctrlp_max_height = 12
