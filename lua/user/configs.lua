local configs = {
    autoindent = true,
    backup = false,
    breakindent = true,
    cindent = true,
    -- clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = {"menu", "menuone", "noinsert", "noselect", "preview"},
    conceallevel = 0,
    cursorline = true,
    encoding = "utf-8",
    expandtab = true,
    fileencoding = "utf-8",
    hidden = true,
    history = 1024,
    hlsearch = true,
    ignorecase = true,
    laststatus = 2,
    list = true,
    listchars = {
        extends = "›",
        nbsp = "·",
        precedes = "‹",
        tab = "» ",
        trail = "·"
    },
    mouse = "a",
    number = true,
    numberwidth = 2,
    pumheight = 10,
    relativenumber = false,
    ruler = true,
    -- scrolloff = 8,
    shiftwidth = 4,
    showbreak = "    ",
    showmatch = true,
    -- showmode = false,
    showtabline = 2,
    -- sidescrollof = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    timeoutlen = 100,
    undodir = os.getenv("HOME") .. "/.cache/nvim/undo",
    undofile = true,
    undolevels = 1024,
    updatetime = 300,
    wrap = true,
    writebackup = false
}
for key, value in pairs(configs) do vim.opt[key] = value end

local shortmess = {"c"}
for _, value in pairs(shortmess) do table.insert(vim.opt["shortmess"], value) end

local whichwrap = {"<", ">", "[", "]", "h", "l"}
for _, value in pairs(whichwrap) do table.insert(vim.opt["whichwrap"], value) end

local iskeyword = {"-"}
for _, value in pairs(iskeyword) do table.insert(vim.opt["iskeyword"], value) end

vim.api.nvim_command("syntax on")
