syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set guicursor=
set nohlsearch
set hidden
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set smartindent
set nocompatible
set signcolumn=yes
set termguicolors
set colorcolumn=80

filetype plugin on
highlight ColorColumn ctermbg=0 guibg=lightgrey
packloadall
colorscheme gruvbox
set background=dark
highlight Normal guibg=none

" netrw directory browser
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

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

" Move selected text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Indent fix for yml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
