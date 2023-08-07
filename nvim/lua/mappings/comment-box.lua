local keymap = vim.keymap.set
local silent = { silent = true }

-- Comment Box
keymap("n", "<leader>cb", "<cmd>lua require('comment-box').lbox()<CR>", silent)
keymap("v", "<leader>cb", "<cmd>lua require('comment-box').lbox()<CR>", silent)
