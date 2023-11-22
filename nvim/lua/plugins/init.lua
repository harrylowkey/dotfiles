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

local dashboard_plugins = require("plugins.dashboard")
local edit_plugins = require("plugins.edit")
local git_plugins = require("plugins.git")
local lsp_language_plugins = require("plugins.language")
local navigator_plugins = require("plugins.navigator")
local terminal_plugins = require("plugins.terminal")
local ui_plugins = require("plugins.ui")
local code_plugins = require("plugins.code")
local cmp_plugins = require("plugins.cmp")

local plugins = merge(
  dashboard_plugins,
  edit_plugins,
  git_plugins,
  lsp_language_plugins,
  navigator_plugins,
  terminal_plugins,
  ui_plugins,
  code_plugins,
  cmp_plugins
)

require("lazy").setup(plugins)
