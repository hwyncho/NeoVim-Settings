local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

local setup = {
    ensure_installed = {
        "bash", "css", "dockerfile", "javascript", "json", "json5", "jsonc",
        "lua", "markdown", "go", "make", "python", "toml", "tsx", "typescript",
        "vim", "vue", "yaml"
    },
    sync_install = false,
    ignore_install = {""},
    autopairs = {enable = true},
    highlight = {
        enable = true,
        disable = {""},
        additional_vim_regex_highlighting = true
    },
    indent = {enable = true, disable = {"yaml"}},
    context_commentstring = {enable = true, enable_autocmd = false}
}
treesitter.setup(setup)
