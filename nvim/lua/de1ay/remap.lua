-- Open netrw on <leader>e
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

-- Clear search highlights on <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Center the cursor on <C-d> and <C-u> jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Make yanking to system clipboard quicker
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Open/Close QuickFix list
vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>cclose<CR>")

-- Clear and close QuickFix list
vim.keymap.set("n", "<leader>qq", function()
	vim.fn.setqflist({}, 'r')
	vim.cmd("cclose")
end)

-- Navigating QuickFix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist)
