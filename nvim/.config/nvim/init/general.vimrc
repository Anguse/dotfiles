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
set background=dark

" netrw directory browser
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

" Exit terminal mode more smoothly
" tnoremap <C-[> <C-\><C-n>

" Move selected text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Closing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
