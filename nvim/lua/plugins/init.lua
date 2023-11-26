local merge = require("utils.merge")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

local core_plugins = require("plugins.core")
local dashboard_plugins = require("plugins.dashboard")
local edit_plugins = require("plugins.edit")
local git_plugins = require("plugins.git")
local lsp_plugins = require("plugins.lsp")
local navigator_plugins = require("plugins.navigator")
local terminal_plugins = require("plugins.terminal")
local ui_plugins = require("plugins.ui")
local coding_plugins = require("plugins.coding")
local cmp_plugins = require("plugins.cmp")
-- local dap_plugins = require("plugins.dap")

local plugins = merge(
    core_plugins,
    dashboard_plugins,
    edit_plugins,
    git_plugins,
    lsp_plugins,
    navigator_plugins,
    terminal_plugins,
    ui_plugins,
    coding_plugins,
    cmp_plugins
-- dap_plugins
)

require("lazy").setup(plugins)
