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

local utils_plugins = require("plugins.utils")
local dashboard_plugins = require("plugins.dashboard")
local edit_plugins = require("plugins.edit")
local git_plugins = require("plugins.git")
local lang_plugins = require("plugins.lang")
local navigator_plugins = require("plugins.navigator")
local terminal_plugins = require("plugins.terminal")
local ui_plugins = require("plugins.ui")

local plugins = merge(
	utils_plugins,
	dashboard_plugins,
	edit_plugins,
	git_plugins,
	lang_plugins,
	navigator_plugins,
	terminal_plugins,
	ui_plugins
)

require("lazy").setup(plugins)
