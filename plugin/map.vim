" 编辑与执行配置文件
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" 大写写转换
inoremap <leader>u <esc>viw<s-u>
inoremap <leader>u <esc>viw<s-u>
nnoremap <leader>u viw<s-u>
inoremap <leader>l <esc>viwu
nnoremap <leader>l viwu

nnoremap H 0
nnoremap L $

nnoremap wh <c-w><c-h>
nnoremap wj <c-w><c-j>
nnoremap wk <c-w><c-k>
nnoremap wl <c-w><c-l>

onoremap p i(
onoremap b /end<cr>

" 补全
inoremap  <c-k> <c-x><c-k>
inoremap  <c-f> <c-x><c-f>
inoremap  <c-l> <c-x><c-l>
inoremap  <c-o> <c-x><c-o>
inoremap  <c-u> <c-x><c-u> 
inoremap  <c-e> <c-x><c-e> 
inoremap  <c-y> <c-x><c-y> 
" 一键编译
nnoremap <F12> :make<cr>
