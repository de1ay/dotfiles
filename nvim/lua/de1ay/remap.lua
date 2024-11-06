vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

-- Clear search highlights on <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

