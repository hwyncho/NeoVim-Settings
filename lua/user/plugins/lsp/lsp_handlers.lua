local function lsp_setup()
    local signs = {
        {name = "DiagnosticSignError", text = ""},
        {name = "DiagnosticSignWarn", text = ""},
        {name = "DiagnosticSignHint", text = ""},
        {name = "DiagnosticSignInfo", text = ""}
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name,
                           {texthl = sign.name, text = sign.text, numhl = ""})
    end

    local config = {
        virtual_text = false,
        signs = {active = signs},
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            border = "rounded",
            focusable = false,
            header = "",
            prefix = "",
            source = "always",
            style = "minimal"
        }
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                                                 vim.lsp.handlers.hover,
                                                 {border = "rounded"})
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"})
end

local function lsp_highlight_document(client)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
                augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]], false)
    end
end

local function lsp_keymaps(bufnr)
    local options = {noremap = true, silent = true}

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD",
                                "<cmd>lua vim.lsp.buf.declaration()<CR>",
                                options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd",
                                "<cmd>lua vim.lsp.buf.definition()<CR>", options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K",
                                "<cmd>lua vim.lsp.buf.hover()<CR>", options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi",
                                "<cmd>lua vim.lsp.buf.implementation()<CR>",
                                options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>",
                                "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                                options)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr",
                                "<cmd>lua vim.lsp.buf.references()<CR>", options)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d",
                                '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
                                options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl",
                                '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
                                options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d",
                                '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
                                options)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q",
                                "<cmd>lua vim.diagnostic.setloclist()<CR>",
                                options)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local function lsp_on_attach(client, bufnr)
    -- if client.name == "tsserver" then
    --     client.resolved_capabilities.document_formatting = false
    -- end

    lsp_highlight_document(client)
    lsp_keymaps(bufnr)

    vim.api.nvim_exec([[
        autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
    ]], false)
end

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
    lsp_capabilities = cmp_nvim_lsp.update_capabilities(lsp_capabilities)
end

local M = {}
M.setup = lsp_setup
M.on_attach = lsp_on_attach
M.capabilities = lsp_capabilities

return M
