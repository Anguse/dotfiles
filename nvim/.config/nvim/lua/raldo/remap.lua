vim.g.mapleader = " "

-- Copy to clipboard
-- vim.keymap.set("v", "<leader>y", "+y")
-- vim.keymap.set("n", "<leader>Y", "+yg_")
-- vim.keymap.set("n", "<leader>y", "+y")
-- vim.keymap.set("n", "<leader>yy", "+yy")

-- Paste from clipboard
-- vim.keymap.set("n", "<leader>p", "+p")
-- vim.keymap.set("n", "<leader>P", "+P")
-- vim.keymap.set("v", "<leader>p", "+p")
-- vim.keymap.set("v", "<leader>P", "+P")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
