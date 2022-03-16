local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then return end

require("user.plugins.lsp.lsp_installer")
require("user.plugins.lsp.lsp_handlers").setup()
require("user.plugins.lsp.lspsaga")
