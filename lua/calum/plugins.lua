local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.api.nvim_create_augroup("packer_user_config",{clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/plugins.lua",
    command = "PackerSync",
    group = "packer_user_config",
})

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- Basic
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use "nvim-lua/popup.nvim"
    use "shaunsingh/nord.nvim"
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"

    -- nvim-tree
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"

    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "github/copilot.vim"

    -- Snipits
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'

    --Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Buffers
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- lualine
    use "nvim-lualine/lualine.nvim"

    --toggleterm
    use "akinsho/toggleterm.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
