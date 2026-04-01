-- Suppress deprecation warnings from plugins to avoid "Press any key" on startup
local original_deprecate = vim.deprecate
vim.deprecate = function() end
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.deprecate = original_deprecate
    end,
})

require("autocmds")

require("options")
require("utils.globals")

require("plugins")
require("mappings")

vim.cmd.colorscheme("gruvbox-material")

-- vim.o.background = "dark"
-- vim.cmd([[ colorscheme neofusion ]])
