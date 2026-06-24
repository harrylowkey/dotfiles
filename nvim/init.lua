-- Silence deprecation popups (e.g. "vim.tbl_flatten is deprecated") emitted by
-- third-party plugins that haven't migrated off deprecated APIs yet. Overriding
-- vim.deprecate at the source stops them before they reach vim.notify/noice.
-- Note: this also hides deprecation notices for our own config on nvim upgrades.
vim.deprecate = function() end

require("autocmds")

require("options")
require("utils.globals")

require("plugins")
require("mappings")

vim.cmd.colorscheme("gruvbox-material")

-- vim.o.background = "dark"
-- vim.cmd([[ colorscheme neofusion ]])
