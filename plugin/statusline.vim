set laststatus=2
set statusline=%!MyStatusLine()

function! MyStatusLine ()
	return "%l/%c  %P of %L%=%y%f"
endfunc
