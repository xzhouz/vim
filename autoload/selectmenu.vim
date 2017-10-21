let s:padding = 2
let s:firstline = 4
let s:numcol = s:padding + 2

function! selectmenu#toggle (title, items)
  exec 'rightbelow 20vne selectmenu'
  let g:selectmenu_title = a:title
  let g:selectmenu_items = a:items
  setlocal nonumber
  setlocal modifiable
  
  let index = 1
  let padding = repeat(' ', s:padding)
  call append('$', padding . g:selectmenu_title)
  call append('$', '')
  for item in g:selectmenu_items
    call append('$', padding . '[' . index . ']  ' . item.text)
    exec "noremap <buffer> " . index . " :call <SID>answer(" . (index-1) . ")<cr>"
    let index = index + 1
  endfor
  setlocal nomodifiable buftype=nofile ft=selectmenu
  call cursor(s:firstline, s:numcol)

	autocmd CursorMoved <buffer> call s:set_cursor()
  nnoremap <buffer> q :call <SID>leave()<cr> 
	nnoremap <buffer> <cr> :call <SID>enter()<cr>
endfunc

function! s:set_cursor ()
  let curline = line('.')
  if (curline < s:firstline)
    let curline = s:firstline
  endif
  call cursor(curline, s:numcol)
  set cul
endfunc

function! <SID>leave ()
  close
endfunc

function! <SID>enter ()
  let line = line('.')
  if line < s:firstline
    call <SID>answer(0)
  else
    call <SID>answer(line - s:firstline)
  endif
endfunc

function! <SID>answer (ind)
  exec g:selectmenu_items[a:ind]['action']
  call <SID>leave()
endfunc
