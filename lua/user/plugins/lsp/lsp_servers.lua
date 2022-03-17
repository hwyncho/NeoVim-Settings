local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then return end

local lsp_handlers = require("user.plugins.lsp.lsp_handlers")
local options = {
    on_attach = lsp_handlers.on_attach,
    capabilities = lsp_handlers.capabilities,
    flags = {debounce_text_changes = 150}
}

local servers = {"jsonls", "pylsp"}

for _, server in pairs(servers) do
    local so_status_ok, server_options = pcall(require,
                                               "user.plugins.lsp.settings." ..
                                                   server)
    if not so_status_ok then server_options = {settings = {}} end

    server_options = vim.tbl_deep_extend("force", server_options, options)

    lsp_config[server].setup(server_options)
end
