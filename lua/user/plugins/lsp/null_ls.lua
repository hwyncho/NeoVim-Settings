local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local formatting_sources = {
    formatting.black.with({}), formatting.prettier.with({}),
    formatting.stylua.with({})
}
local diagnostics_sources = {
    diagnostics.flake8.with({}), diagnostics.pylint.with({}),
    diagnostics.mypy.with({})
}

local setup = {
    debug = false,
    sources = {
        table.unpack(formatting_sources), table.unpack(diagnostics_sources)
    }
}
null_ls.setup(setup)
