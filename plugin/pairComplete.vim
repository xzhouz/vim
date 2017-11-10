" 括号补全
let s:pairs = ['()', '[]', '{}']

for pair in s:pairs
  exec 'inoremap ' . pair[0] . ' ' . pair[0] . pair[1] . '<esc>i'
  exec "inoremap " . pair[1] . " <c-r>=SkipPair('" . pair[1] . "')<cr>"
endfor

inoremap <bs> <c-r>=Delete()<cr>

function! SkipPair(p)
  if getline('.')[col('.')-1] == a:p
    return "\<esc>la"
  else
    return a:p
  endif
endfunction

function! Delete()
  let curline = getline('.')
  if IsBegin(curline[col('.')-2]) 
    if col('.') >= len(curline)
      return "\<esc>mp%x`pxa"
    else
      return "\<esc>mp%x`pxi"
    endif
  else
    return "\<bs>"
  endif
endfunction

function! IsBegin(char)
  let ret = 0
  for p in s:pairs
    if a:char == p[0]
      let ret = 1
    endif
  endfor
  return ret
endfunction
