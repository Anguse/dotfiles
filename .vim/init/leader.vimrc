let mapleader = " "

" Builtin filetree just because
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Quickfix and Local list
nnoremap <silent> <Leader>ln :lnext<CR>
nnoremap <silent> <Leader>lp :lprevious<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-j><C-j> :copen<CR>

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" Avoid escape
imap jj <Esc>
