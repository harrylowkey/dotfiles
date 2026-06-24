vim.cmd("autocmd!") -- clear all eixsted autommands

vim.scriptencoding = "utf-8"
vim.wo.number = true

-- Undercurl (handled natively by Neovim with termguicolors)

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste",
})

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "orange" })

