local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local nvim_tree_config = require("nvim-tree.config")
local nvim_tree_callback = nvim_tree_config.nvim_tree_callback

local setup = {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {"alpha", "dashboard", "startify"},
    -- auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_directories = {enable = true, auto_open = true},
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
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true
            },
            glyphs = {
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
        },
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {enable = true}
        }
    }
}
nvim_tree.setup(setup)

local set_keymap = vim.api.nvim_set_keymap
local options = {noremap = true}
local mode_normal = "n"
set_keymap(mode_normal, "<C-n>", ":NvimTreeToggle<CR>", options)
set_keymap(mode_normal, "<leader>r", ":NvimTreeRefresh<CR>", options)
set_keymap(mode_normal, "<leader>n", ":NvimTreeFindFile<CR>", options)
