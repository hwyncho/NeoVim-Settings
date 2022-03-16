local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return end

local actions = require "telescope.actions"
local setup = {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = {"smart"},
        mappings = {
            i = {
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                ["<C-c>"] = actions.close,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-l>"] = actions.complete_tag,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-t>"] = actions.select_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<CR>"] = actions.select_default,
                ["<Down>"] = actions.move_selection_next,
                ["<M-q>"] = actions.send_selected_to_qflist +
                    actions.open_qflist,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<S-Tab>"] = actions.toggle_selection +
                    actions.move_selection_better,
                ["<Tab>"] = actions.toggle_selection +
                    actions.move_selection_worse,
                ["<Up>"] = actions.move_selection_previous
            },
            n = {
                ["?"] = actions.which_key,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-t>"] = actions.select_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<CR>"] = actions.select_default,
                ["<Down>"] = actions.move_selection_next,
                ["<esc>"] = actions.close,
                ["<M-q>"] = actions.send_selected_to_qflist +
                    actions.open_qflist,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<S-Tab>"] = actions.toggle_selection +
                    actions.move_selection_better,
                ["<Tab>"] = actions.toggle_selection +
                    actions.move_selection_worse,
                ["<Up>"] = actions.move_selection_previous,
                ["G"] = actions.move_to_bottom,
                ["gg"] = actions.move_to_top,
                ["H"] = actions.move_to_top,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["L"] = actions.move_to_bottom,
                ["M"] = actions.move_to_middle
            }
        }
    },
    pickers = {},
    extensions = {}
}
telescope.setup(setup)

local set_keymap = vim.api.nvim_set_keymap
local options = {noremap = true}
local mode_normal = "n"
set_keymap(mode_normal, "<leader>ff", ":Telescope find_files<CR>", options)
set_keymap(mode_normal, "<leader>fg", ":Telescope live_grep<CR>", options)
set_keymap(mode_normal, "<leader>fb", ":Telescope buffers<CR>", options)
set_keymap(mode_normal, "<leader>fh", ":Telescope help_tags<CR>", options)
