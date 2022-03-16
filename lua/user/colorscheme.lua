if string.find(os.getenv("TERM"), "256color") then
    vim.opt["termguicolors"] = true
end

vim.opt["background"] = "dark"
vim.api.nvim_command("colorscheme default")
