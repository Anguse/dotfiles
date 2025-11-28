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
    colorscheme = {
      enable_preview = true
    },
    find_files = {
      hidden = true,
    }
  },
  extensions = {
    advanced_git_search = {
      -- Show builtin git pickers when in git directory
      show_builtin = true,
      -- Disable default keymaps
      disable_keymaps = false,
      -- Disable cache for git file_list
      disable_cache = false
    },
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
local t = require('telescope')
t.load_extension('advanced_git_search')
t.load_extension('harpoon')
t.load_extension('project')
t.load_extension('zoxide')
t.load_extension('live_grep_args')

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>[', builtin.find_files, {})
vim.keymap.set('n', '<leader>z', t.extensions.project.project, {})
vim.keymap.set('n', '<leader><leader>', builtin.resume, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pf', builtin.grep_string, {})
vim.keymap.set('n', '<leader>pg', function()
  builtin.live_grep({
    cwd = '/home/hdla/wss/gitlab/',
  })
end)
vim.keymap.set('n', '<leader>g', t.extensions.advanced_git_search.search_log_content, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<leader>]', t.extensions.zoxide.list, {})
