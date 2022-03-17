local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then return end

local lsp_handlers = require("user.plugins.lsp.lsp_handlers")
local options = {
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
    flags = {debounce_text_changes = 150}
}

local server = "pylsp"
local pylsp_options = require("user.plugins.lsp.settings.pylsp")

options = vim.tbl_deep_extend("force", pylsp_options, options)

lsp_config[server].setup(options)
