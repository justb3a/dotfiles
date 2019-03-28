" Lightline config
"======================================================================

let g:lightline = {
  \ 'colorscheme': 'powerline',
  \ 'component_function': {
  \   'modified': 'LightlineModified',
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive',
  \   'filename': 'LightlineFilename',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \   'fileencoding': 'LightlineFileencoding',
  \   'mode': 'LightlineMode',
  \ }
  \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
  \   'right': [
  \              [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ],
  \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
  \            ]
  \}

let g:lightline#ale#indicator_checking = "..."
let g:lightline#ale#indicator_warnings = "W:"
let g:lightline#ale#indicator_errors = "E:"
let g:lightline#ale#indicator_ok = "OK"

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '*' : &modifiable ? '' : '~ɯ'

endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '~ɹ' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
    \ (&ft == 'unite' ? unite#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '∴ '._ : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return &ft == 'unite' ? 'Unite' : winwidth(0) > 60 ? lightline#mode() : ''
endfunction
