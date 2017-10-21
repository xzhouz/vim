for item in g:selectmenu_items
  exec "syntax keyword SelectmenuItem " . item['text']
endfor

setlocal iskeyword+=?
exec "syntax keyword SelectmenuTitle " . g:selectmenu_title

syntax match SelectmenuNumber /\(\[\)\@<=\d\+\(\]\)\@=/

hi link SelectmenuNumber Question
hi link SelectmenuItem NonText
hi link SelectmenuTitle Title
