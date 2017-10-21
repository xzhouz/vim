" 括号补全
let pairs = ['()', '[]', '{}']

for pair in pairs
  execute 'inoremap ' . pair[0] . ' ' . pair[0] . pair[1] . '<esc>i'
  execute "inoremap " . pair[1] . " <c-r>=SkipPair('" . pair[1] . "')<cr>"
endfor

function! SkipPair(p)
  if getline('.')[col('.')-1] == a:p
    return "\<esc>la"
  else
    return a:p
  endif
endfunction
