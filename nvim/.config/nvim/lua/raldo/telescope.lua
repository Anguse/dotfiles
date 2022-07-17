require("telescope").setup {
  extensions = {
    project = {
      base_dirs = {
      }
    }
  }
}
require("telescope").load_extension('harpoon')
require("telescope").load_extension('project')
