require("telescope").setup {
  defaults = {
    file_ignore_patterns = {".git/"},
    vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
        '--case-sensitive',
        '--glob=!.git/',
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  },
  extensions = {
    project = {
      base_dirs = {
        {'~/.dotfiles'},
        {'~/.config/nvim'}
      },
      hidden_files = true,
      theme = "dropdown",
      sync_with_nvim_tree = true
    }
  }
}

require("telescope").load_extension('harpoon')
require("telescope").load_extension('project')

local builtin = require("telescope.builtin")
local project = require("telescope").extensions.project

vim.keymap.set('n', '<leader>[', builtin.find_files, {})
vim.keymap.set('n', '<leader>]', project.project, {})
vim.keymap.set('n', '<leader><leader>', builtin.resume, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pf', builtin.grep_string, {})
vim.keymap.set('n', '<leader>pg', function()
  builtin.live_grep({
    cwd = '/home/hdla/wss/gitlab/',
  })
end)
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
