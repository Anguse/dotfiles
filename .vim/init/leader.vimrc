let mapleader = " "

" Builtin filetree just because
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Quickfix and Local list
nnoremap <silent> <Leader>ln :lnext<CR>
nnoremap <silent> <Leader>lp :lprevious<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <C-j> :cnext<CR>

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" Avoid escape
imap jj <Esc>
