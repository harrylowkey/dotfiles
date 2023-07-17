local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"pyright",
		"terraformls",
	},
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"black",
		"flake8",
		-- "mypy",
		-- "ruff",
	},
	automatic_installation = true,
})
