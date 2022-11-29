require("telescope").setup {
  defaults = {
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
  extensions = {
    project = {
      base_dirs = {
        {'~/.dotfiles'},
        {'~/.config/nvim'}
      },
      hidden_files = true,
      theme = "dropdown",
      sync_with_nvim_tree = false
    }
  }
}

require("telescope").load_extension('harpoon')
require("telescope").load_extension('project')
