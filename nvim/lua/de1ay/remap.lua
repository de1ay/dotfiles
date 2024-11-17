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

