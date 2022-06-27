local configs = require("nvim-treesitter.configs")

configs.setup {
    sync_install = true,
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml" } },

    autopairs = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extend_mode = false,
        max_file_lines = nil, -- Might wwant to change this for performance
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}

-- This is the only way I can currently set hl colors
-- Check  https://github.com/p00f/nvim-ts-rainbow/issues/81
vim.api.nvim_set_hl(0, "rainbowcol1", {bg="NONE", fg="#ECEFF4"})
vim.api.nvim_set_hl(0, "rainbowcol2", {bg="NONE", fg="#8FBCBB"})
vim.api.nvim_set_hl(0, "rainbowcol3", {bg="NONE", fg="#88C0D0"})
vim.api.nvim_set_hl(0, "rainbowcol4", {bg="NONE", fg="#81A1C1"})
vim.api.nvim_set_hl(0, "rainbowcol5", {bg="NONE", fg="#5E81AC"})
vim.api.nvim_set_hl(0, "rainbowcol6", {bg="NONE", fg="#B48EAD"})

