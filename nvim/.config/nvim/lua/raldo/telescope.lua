require("telescope").setup {
  extensions = {
    project = {
      base_dirs = {
        '~/workspace/src/mvp-demo/mvp_new',
        '~/workspace/src/mvp-demo/packer/image-builder'
      }
    }
  }
}
require("telescope").load_extension('harpoon')
require("telescope").load_extension('project')
