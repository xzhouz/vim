let title = 'hello www'
let items = [
\  {
\    'text': 'white',
\    'action': 'let g:color="white"'
\  },
\  {
\    'text': 'yellow',
\    'action': 'let g:color="yellow"'
\  },
\  {
\    'text': 'black',
\    'action': 'let g:color="black"'
\  }
\]
nnoremap <f10> :call selectmenu#toggle(title, items)<cr>
