" 括号补全
let s:pairs = ['()', '[]', '{}']

for pair in s:pairs
  exec 'inoremap ' . pair[0] . ' ' . pair[0] . pair[1] . '<esc>i'
  exec "inoremap " . pair[1] . " <c-r>=SkipPair('" . pair[1] . "')<cr>"
endfor

inoremap <bs> <c-r>=Delete()<cr>
inoremap <cr> <c-r>=Enter()<cr>

function! Enter()
  let curline = getline('.')
  let index = IsBegin(curline[col('.')-2])
  if index != -1
    return "\<cr>\<esc>v<O"
  else
    return "\<cr>"
  endif
endfunction
    

function! SkipPair(p)
  if getline('.')[col('.')-1] == a:p
    return "\<esc>la"
  else
    return a:p
  endif
endfunction

function! Delete()
  let curline = getline('.')
  if IsBegin(curline[col('.')-2]) != -1
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
  let l = len(s:pairs)
  while (ret < l)
    if a:char == s:pairs[ret][0]
      return ret
    endif
    let ret = ret + 1
  endwhile
  return -1
endfunction
