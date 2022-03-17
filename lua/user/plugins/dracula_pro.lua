local dracula_pro_path = vim.fn.stdpath("data") ..
                             "/site/pack/themes/start/dracula_pro"
if vim.fn.empty(vim.fn.glob(dracula_pro_path)) == 0 then
    vim.api.nvim_command("packadd dracula_pro")
    vim.api.nvim_command("colorscheme dracula_pro")
end
