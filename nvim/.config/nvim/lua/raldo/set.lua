vim.opt.syntax = "on"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.smartindent = true
vim.opt.compatible = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
-- vim.opt.filetype = "plugin on"
vim.opt.background = "dark"
vim.opt.guifont = "monospace:h17"
vim.opt.shortmess:append "c"

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]

-- highlight ColorColumn ctermbg=0 guibg=lightgrey
-- packloadall

-- " netrw directory browser
-- let g:netrw_browse_split=2
-- let g:netrw_banner=0
-- let g:netrw_winsize=25

-- " Exit terminal mode more smoothly
-- tnoremap <C-[> <C-\><C-n>

-- " Move selected text
-- vnoremap J :m '>+1<CR>gv=gv
-- vnoremap K :m '<-2<CR>gv=gv

-- " Indent fix for yml files
-- autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

-- " Allow saving of files as sudo when I forgot to start vim using sudo.
-- cmap w!! w !sudo tee > /dev/null %

-- " Closing brackets
-- inoremap " ""<left>
-- inoremap ' ''<left>
-- inoremap ( ()<left>
-- inoremap [ []<left>
-- inoremap { {}<left>
-- inoremap {<CR> {<CR>}<ESC>O
-- inoremap {;<CR> {<CR>};<ESC>O
