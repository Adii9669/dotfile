local opt = { noremap = true, silent = true }
local keymap = vim.keymap.set

--for loacating directories
keymap("n", "<leader>pv", "<cmd>Ex<cr>")

--Exit insert mode
keymap("i", "jj", "<ESC>")

--For quit and save the files
keymap("n", "<leader>w", "<cmd>w<cr>")
keymap("n", "<leader>q", "<cmd>q<cr>")
keymap("n", "<leader>s", "<cmd>wq<cr>")

--For Changing buffer present
keymap("n", "<C-i>", "<cmd>bprev<cr>")
keymap("n", "<C-o>", "<cmd>bnext<cr>")

--For lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>")

--source
keymap("n", "<leader>so", ":w<CR>:so %<CR>")

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

-- New Windows
keymap("n", "<leader>h", "<CMD>vsplit<CR>")
keymap("n", "<leader>v", "<CMD>split<CR>")

-- Switch between tabs
keymap("n", "<leader>tt", ":tabnext<CR>", opt) -- Next tab
keymap("n", "<leader>tp", ":tabprevious<CR>", opt) -- Previous tab

-- Go to specific tab
keymap("n", "<leader>1", "1gt", opt) -- Go to first tab
keymap("n", "<leader>2", "2gt", opt) -- Go to second tab
keymap("n", "<leader>3", "3gt", opt) -- Go to third tab

-- Open and close tabs
keymap("n", "<leader>tn", ":tabnew<CR>", opt) -- Open a new tab
keymap("n", "<leader>tr", ":tabclose<CR>", opt) -- Close the current tab

--Mason
keymap("n", "<leader>ms", "<cmd>:Mason<cr>", opt)
