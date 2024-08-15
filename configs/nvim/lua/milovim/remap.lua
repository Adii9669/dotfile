local opt = { noremap = true, silent = true }
local keymap = vim.keymap.set


-- Save
keymap("n", "<leader>w", "<CMD>update<CR>")

-- go to directories
keymap("n", "<leader>pv", "<CMD>Ex<CR>")

-- Quit
keymap("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
-- keymap("i", "jk", "<ESC>")

keymap("n", "<leader>fm", "<CMD>Format<CR>")


--change buffer
keymap("n", "<C-[>", "<Cmd>bprev<CR>", opt)
keymap("n", "<C-]>", "<Cmd>bnext<CR>", opt)

--keymap("n", "<C-n>", "gcc")

-- NeoTree
keymap("n", "<leader>e", "<CMD>Neotree toggle<CR>", opt)
keymap("n", "<leader>r", "<CMD>Neotree focus<CR>", opt)

-- New Windows
keymap("n", "<leader>hs", "<CMD>vsplit<CR>")
keymap("n", "<leader>vh", "<CMD>split<CR>")

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-j>", "<C-w>j")

-- Resize Windows
keymap("n", "<C-Left>", "<C-w><")
keymap("n", "<C-Right>", "<C-w>>")
keymap("n", "<C-Up>", "<C-w>+")
keymap("n", "<C-Down>", "<C-w>-")

--Trouble diagnostics
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
