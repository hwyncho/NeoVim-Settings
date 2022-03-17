local packer_path = vim.fn.stdpath("data") ..
                        "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    packer_bootstrap = vim.fn.system({
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", packer_path
    })
end

vim.api.nvim_command("packadd packer.nvim")
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

local packer_config = {display = {open_fn = require("packer.util").float}}

return require('packer').startup({
    function(use)
        use "wbthomason/packer.nvim"

        use "antoinemadec/FixCursorHold.nvim"
        use "folke/which-key.nvim"
        use "lewis6991/impatient.nvim"
        use "lukas-reineke/indent-blankline.nvim"
        use "moll/vim-bbye"
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"
        use "numToStr/Comment.nvim"

        use {
            "akinsho/bufferline.nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
        }
        use "akinsho/toggleterm.nvim"
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {"kyazdani42/nvim-web-devicons"}
        }
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
        }
        use {
            'nvim-telescope/telescope.nvim',
            requires = {"nvim-lua/plenary.nvim"}
        }

        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"

        use "lewis6991/gitsigns.nvim"

        use "onsails/lspkind-nvim"
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-buffer", "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip"
            }
        }

        use "glepnir/lspsaga.nvim"
        use "neovim/nvim-lspconfig"
        use "tamago324/nlsp-settings.nvim"
        use "williamboman/nvim-lsp-installer"

        if packer_bootstrap then require("packer").sync() end
    end,
    config = packer_config
})
