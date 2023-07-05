-- Lua
vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tc", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
