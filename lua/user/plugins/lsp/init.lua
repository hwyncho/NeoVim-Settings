local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

local lsp_handlers = require("user.plugins.lsp.lsp_handlers")
lsp_handlers.setup()

require("user.plugins.lsp.servers.pylsp")

require("user.plugins.lsp.lspsaga")
