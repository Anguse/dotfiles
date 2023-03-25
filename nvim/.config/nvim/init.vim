source ~/.config/nvim/init/general.vimrc
source ~/.config/nvim/init/leader.vimrc
source ~/.config/nvim/init/functions.vimrc
source ~/.config/nvim/init/plugins.vimrc

lua require "raldo.colorscheme"
" lua require "raldo.options"
lua require "raldo.plugins"
lua require "raldo.cmp"
lua require "raldo.lsp"
lua require "raldo.telescope"
lua require "raldo.treesitter"
lua require "raldo.lualine"
lua require "raldo.nvim-tree"
lua require "raldo.null-ls"

lua require "toggleterm".setup()
