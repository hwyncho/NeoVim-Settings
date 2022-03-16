local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then return end

local setup = {
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "▎",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn"
        },
        change = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        },
        delete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        }
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {interval = 1000, follow_files = true},
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false
    },
    current_line_blame_formatter_opts = {relative_time = false},
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1
    },
    yadm = {enable = false},
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        local options = {noremap = true, silent = true}
        local options2 = {noremap = true, silent = true, expr = true}
        local mode_normal = "n"
        local mode_visual = "v"
        local mode_visual_block = "x"

        buf_set_keymap(bufnr, mode_normal, "]c",
                       "&diff ? ']c' : ':Gitsigns next_hunk<CR>'", options2)
        buf_set_keymap(bufnr, mode_normal, "[c",
                       "&diff ? '[c' : ':Gitsigns prev_hunk<CR>'", options2)

        buf_set_keymap(bufnr, mode_normal, "<leader>hs",
                       ":Gitsigns stage_hunk<CR>", options)
        buf_set_keymap(bufnr, mode_visual, "<leader>hs",
                       ":Gitsigns stage_hunk<CR>", options)
        buf_set_keymap(bufnr, mode_normal, "<leader>hr",
                       ":Gitsigns reset_hunk<CR>", options)
        buf_set_keymap(bufnr, mode_visual, "<leader>hr",
                       ":Gitsigns reset_hunk<CR>", options)
        buf_set_keymap(bufnr, mode_normal, "<leader>hu",
                       ":Gitsigns undo_stage_hunk<CR>", options)
        buf_set_keymap(bufnr, mode_normal, "<leader>hp",
                       ":Gitsigns preview_hunk<CR>", options)

        buf_set_keymap(bufnr, mode_normal, "<leader>hS",
                       ":Gitsigns stage_buffer<CR>", options)
        buf_set_keymap(bufnr, mode_normal, "<leader>hR",
                       ":Gitsigns reset_buffer<CR>", options)

        buf_set_keymap(bufnr, mode_normal, "<leader>hb",
                       ':lua require"gitsigns".blame_line{full=true}<CR>',
                       options)
        buf_set_keymap(bufnr, mode_normal, "<leader>tb",
                       ":Gitsigns toggle_current_line_blame<CR>", options)

        buf_set_keymap(bufnr, mode_normal, "<leader>hd",
                       ":Gitsigns diffthis<CR>", options)
        buf_set_keymap(bufnr, mode_normal, "<leader>hD",
                       ':lua require"gitsigns".diffthis("~")<CR>', options)

        buf_set_keymap(bufnr, mode_normal, "<leader>td",
                       ":Gitsigns toggle_deleted<CR>", options)

        buf_set_keymap(bufnr, "o", "ih", ":<C-U>Gitsigns select_hunk<CR>",
                       options)
        buf_set_keymap(bufnr, mode_visual_block, "ih",
                       ":<C-U>Gitsigns select_hunk<CR>", options)
    end
}
gitsigns.setup(setup)
