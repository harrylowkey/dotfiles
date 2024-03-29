local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { silent = true })
keymap.set("n", "x", '"_x')

-- Increment/decement
keymap.set("n", "<C-+>", "<C-a>")
keymap.set("n", "<C-_>", "<C-x>")

-- Select all
keymap.set("n", "<S-a>", "gg<S-v>G")

-- Select and replace multiple same word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- todo
keymap.set("n", "<leader>td", ":TodoTelescope<CR>")

-- markdown preview
keymap.set("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>")
