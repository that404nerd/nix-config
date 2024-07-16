local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local filename

filename = io.read("a")
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- other keymaps
keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-r>", ":NvimTreeRefresh<CR>", opts)
-- splits
keymap("n", "<C-w-s>", ":split", opts)
keymap("n", "<C-w-v>", ":vsplit", opts)

-- buffers
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-p>", ":bprevious<CR>", opts)
keymap("n", "<C-q>", ":bd<CR>", opts)

-- Move text up and down
keymap("n", "<tab>j", "<cmd>m .+1<cr>==", opts)
keymap("n", "<tab>k", "<cmd>m .-2<cr>==", opts)
