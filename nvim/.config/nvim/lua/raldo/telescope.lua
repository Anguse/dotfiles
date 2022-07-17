require("telescope").setup {
  extensions = {
    project = {
      base_dirs = {
        {'~/.dotfiles'},
        {'~/.config/nvim'}
      },
      hidden_files = true,
      theme = "dropdown"
    }
  }
}
require("telescope").load_extension('harpoon')
require("telescope").load_extension('project')
