local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "H", "^", opts)
keymap("x", "H", "^", opts)
keymap("n", "L", "g_", opts)
keymap("x", "L", "g_", opts)

keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Switch windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize things
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- ToggleTerm
keymap("n", "<leader><Right>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader><Left>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>qq", ":Bdelete!<CR>", opts)
keymap("n", "<leader>wq", ":w<CR> :Bdelete!<CR>", opts)
keymap("n", "<leader>lg", ":lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Mac os Specific
-- Must bind option key to ESC+ for this to work
if (vim.api.nvim_eval("g:is_mac")) then
    keymap("n", "<Esc>k", ":m .-2<CR>==", opts)
    keymap("n", "<Esc>j", ":m .+1<CR>==", opts)
    keymap("x", "<Esc>k", ":move '<-2<CR>gv-gv", opts)
    keymap("x", "<Esc>j", ":move '>+1<CR>gv-gv", opts)
    keymap("i", "<Esc>;", "<ESC>miA;<ESC>`ii", opts)
    keymap("n", "<Esc>g", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
else
    keymap("n", "<A-k>", ":m .-2<CR>==", opts)
    keymap("n", "<A-j>", ":m .+1<CR>==", opts)
    keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
    keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
    keymap("i", "<A-;>", "<ESC>miA;<ESC>`ii", opts)
    keymap("n", "<A-g>", ":lua _LAZYGIT_TOGGLE()<CR>", opts)
end

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>b", ":NvimTreeToggle<cr>", opts)
