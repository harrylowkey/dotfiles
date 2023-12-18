local keymap = vim.keymap

keymap.set("n", "<leader>gdo", ":DiffviewOpen<CR>") -- open git status
keymap.set("n", "<leader>gdc", ":DiffviewClose<CR>") -- close git status
keymap.set("n", "<leader>gdh", ":DiffviewFileHistory<CR>") -- git history
keymap.set("n", "<leader>gdf", ":DiffviewFileHistory %<CR>") -- git current file history
