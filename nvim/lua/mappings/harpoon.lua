vim.keymap.set("n", "<leader>mf", ":Telescope harpoon marks<CR>")
vim.keymap.set("n", ",mf", ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set("n", "<leader>mn", ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set("n", "<leader>mp", ':lua require("harpoon.ui").nav_prev()<CR>')
vim.keymap.set("n", "<leader>mm", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
