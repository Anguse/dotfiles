require("telescope").setup {
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
