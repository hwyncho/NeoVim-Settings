local status_ok, which_key = pcall(require, "which-key")
if not status_ok then return end

local setup = {
    plugins = {
        marks = true,
        registers = true,
        spelling = {enabled = true, suggestions = 20},
        presets = {
            operators = false,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true
        }
    },
    key_labels = {},
    icons = {breadcrumb = "»", separator = "➜", group = "+"},
    popup_mappings = {scroll_down = "<C-d>", scroll_up = "<C-u>"},
    window = {
        border = "rounded",
        position = "bottom",
        margin = {1, 0, 1, 0},
        padding = {2, 2, 2, 2},
        winblend = 0
    },
    layout = {
        height = {min = 4, max = 25},
        width = {min = 20, max = 50},
        spacing = 3,
        align = "left"
    },
    ignore_missing = true,
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
    show_help = true,
    triggers = "auto",
    triggers_blacklist = {i = {"j", "k"}, v = {"j", "k"}}
}
which_key.setup(setup)

local mappings = {}
local options = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true
}
which_key.register(mappings, options)
