local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local nvim_tree_config = require("nvim-tree.config")
local nvim_tree_callback = nvim_tree_config.nvim_tree_callback

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}
local setup = {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {"alpha", "dashboard", "startify"},
    -- auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    update_to_buf_dir = {enable = true, auto_open = true},
    diagnostics = {
        enable = true,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
    system_open = {cmd = nil, args = {}},
    filters = {dotfiles = false, custom = {}},
    git = {enable = true, ignore = true, timeout = 500},
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                {key = {"l", "<CR>", "o"}, cb = nvim_tree_callback "edit"},
                {key = "h", cb = nvim_tree_callback "close_node"},
                {key = "v", cb = nvim_tree_callback "vsplit"}
            }
        },
        number = false,
        relativenumber = false
    },
    trash = {cmd = "trash", require_confirm = true},
    quit_on_open = 0,
    git_hl = 1,
    disable_window_picker = 0,
    root_folder_modifier = ":t",
    show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
        tree_width = 30
    }
}
nvim_tree.setup(setup)

local set_keymap = vim.api.nvim_set_keymap
local options = {noremap = true}
local mode_normal = "n"
set_keymap(mode_normal, "<C-n>", ":NvimTreeToggle<CR>", options)
set_keymap(mode_normal, "<leader>r", ":NvimTreeRefresh<CR>", options)
set_keymap(mode_normal, "<leader>n", ":NvimTreeFindFile<CR>", options)
