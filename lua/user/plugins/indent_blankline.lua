local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then return end

vim.g.indent_blankline_buftype_exclude = {"nofile", "terminal"}
vim.g.indent_blankline_filetype_exclude = {
    "dashboard", "help", "neogitstatus", "NvimTree", "packer", "startify",
    "Trouble"
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    "^for", "^if", "^object", "^table", "^while", "arguments", "block",
    "catch_clause", "class", "else_clause", "function", "if_statement",
    "import_statement", "jsx_element", "jsx_element",
    "jsx_self_closing_element", "method", "operation_type", "return",
    "try_statement"
}

vim.wo.colorcolumn = "99999"

local setup = {show_current_context = true}
indent_blankline.setup(setup)
