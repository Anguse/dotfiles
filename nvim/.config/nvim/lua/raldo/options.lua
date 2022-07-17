local options = {
    syntax        = "on",
    noerrorbells  = true,
    tabstop       = 4,
    softtabstop   = 4,
    shiftwidth    = 4,
    expandtab     = true,
    guicursor     = true,
    nohlsearch    = true,
    hidden        = true,
    nu            = true,
    rnu           = true,
    nowrap        = true,
    smartcase     = true,
    noswapfile    = true,
    nobackup      = true,
    undofile      = true,
    incsearch     = true,
    scrolloff     = 8,
    smartindent   = true,
    nocompatible  = true,
    signcolumn    = "yes",
    termguicolors = true,
    colorcolumn   = 80,
    filetype      = "plugin on",
    background    = "dark",
    guifont       = "monospace:h17",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

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
