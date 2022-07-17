require("telescope").setup {
  extensions = {
    project = {
      base_dirs = {
        '~/.dotfiles'
      }
    }
  }
}
require("telescope").load_extension('harpoon')
require("telescope").load_extension('project')
