local keymap = vim.keymap
local opts = { buffer = 0 }

keymap.set("n", "<leader>3", "<cmd>ToggleTerm direction=horizontal<CR>")
keymap.set("n", "<leader>4", "<cmd>ToggleTerm direction=vertical size=40<CR>")
-- keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
-- keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
-- keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
-- keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

function _G.set_terminal_keymaps()
   local opts = { buffer = 0 }
   vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
   vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
   vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
   vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
   vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
   vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
   vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
