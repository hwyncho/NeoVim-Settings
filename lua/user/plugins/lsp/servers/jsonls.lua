local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then return end

local lsp_handlers = require("user.plugins.lsp.lsp_handlers")
local options = {
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
    flags = {debounce_text_changes = 150}
}

local server = "jsonls"
local jsonls_options = require("user.plugins.lsp.settings.jsonls")

options = vim.tbl_deep_extend("force", jsonls_options, options)
options = vim.tbl_deep_extend("force", {
    cmd = {"vscode-json-languageserver", "--stdio"}
}, options)

lsp_config[server].setup(options)
