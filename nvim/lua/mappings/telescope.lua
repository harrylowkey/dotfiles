local keymap = vim.keymap
local opt = { silent = true, noremap = true }

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opt)  -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opt)   -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opt) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opt)     -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true<cr>", opt)
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", opt)
keymap.set("n", "<leader>?", "<cmd>Telescope help_tags<cr>", opt) -- list available help tags
