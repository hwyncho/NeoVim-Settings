local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then return end

lsp_installer.on_server_ready(function(server)
    local options = {
        on_attach = require("user.plugins.lsp.lsp_handlers").on_attach,
        capabilities = require("user.plugins.lsp.lsp_handlers").capabilities
    }

    server:setup(options)
end)
