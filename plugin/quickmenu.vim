" choose a favorite key to show/hide quickmenu
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"
call g:quickmenu#append('item 1.1', 'echo "1.1 is selected"', 'select item 1.1')
