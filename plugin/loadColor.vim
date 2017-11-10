nnoremap <leader>c :call <SID>loadColor()<cr>

function! <SID>loadColor()
  let tmp_dir = $HOME . '/.vimcolor_tmp/'
  let colordir = $HOME . '/.vim/colors/'
  let addr = input("Input the address of the git repository:\n")
  echo "\n"
  let name = input("Input the name of the color scheme:\n")

  exec "!git clone " . addr . " " . tmp_dir
  let colorfile = tmp_dir . 'colors/' . name . '.vim'
  echom "colorfile" colorfile
  if filereadable(colorfile)
    echom "aaaaa"
    exec "!mv " . colorfile . ' ' . colordir
    exec "color " . name
  else
    echohl ErrorMsg
    echom "The color file(". colorfile . ") does not exist!"
    echohl None
  endif
  exec "!rm -rf " . tmp_dir
endfunc
