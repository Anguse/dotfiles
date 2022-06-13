local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

lspconfig = require "lspconfig"

require "raldo.lsp.configs"
require("raldo.lsp.handlers").setup()
