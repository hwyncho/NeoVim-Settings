local set_keymap = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
local options_term = {silent = true}

local mode_command = "c"
local mode_insert = "i"
local mode_normal = "n"
local mode_term = "t"
local mode_visual = "v"
local mode_visual_block = "x"

set_keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

set_keymap(mode_normal, "<leader><CR>", ":let @/=''<CR>", options)

-- Better window navigation
set_keymap(mode_normal, "<C-h>", "<C-w>h", options)
set_keymap(mode_normal, "<C-j>", "<C-w>j", options)
set_keymap(mode_normal, "<C-k>", "<C-w>k", options)
set_keymap(mode_normal, "<C-l>", "<C-w>l", options)

-- Resize with arrows
set_keymap(mode_normal, "<C-Up>", ":resize -2<CR>", options)
set_keymap(mode_normal, "<C-Down>", ":resize +2<CR>", options)
set_keymap(mode_normal, "<C-Left>", ":vertical resize -2<CR>", options)
set_keymap(mode_normal, "<C-Right>", ":vertical resize +2<CR>", options)

-- Navigate buffers
set_keymap(mode_normal, "<S-l>", ":bnext<CR>", options)
set_keymap(mode_normal, "<S-h>", ":bprevious<CR>", options)

-- Move text up and down
set_keymap(mode_normal, "<A-j>", "<Esc>:m .+1<CR>==gi", options)
set_keymap(mode_normal, "<A-k>", "<Esc>:m .-2<CR>==gi", options)

-- Press jk fast to enter
set_keymap(mode_insert, "jk", "<ESC>", options)

-- Stay in indent mode
set_keymap(mode_visual, "<", "<gv", options)
set_keymap(mode_visual, ">", ">gv", options)

-- Move text up and down
set_keymap(mode_visual, "<A-j>", ":m .+1<CR>==", options)
set_keymap(mode_visual, "<A-k>", ":m .-2<CR>==", options)
set_keymap(mode_visual, "p", '"_dP', options)

-- Move text up and down
set_keymap(mode_visual_block, "J", ":move '>+1<CR>gv-gv", options)
set_keymap(mode_visual_block, "K", ":move '<-2<CR>gv-gv", options)
set_keymap(mode_visual_block, "<A-j>", ":move '>+1<CR>gv-gv", options)
set_keymap(mode_visual_block, "<A-k>", ":move '<-2<CR>gv-gv", options)

-- Better terminal navigation
-- set_keymap(mode_term, "<C-h>", "<C-\\><C-N><C-w>h", options_term)
-- set_keymap(mode_term, "<C-j>", "<C-\\><C-N><C-w>j", options_term)
-- set_keymap(mode_term, "<C-k>", "<C-\\><C-N><C-w>k", options_term)
-- set_keymap(mode_term, "<C-l>", "<C-\\><C-N><C-w>l", options_term)
