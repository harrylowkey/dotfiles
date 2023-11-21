local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"eslint",
		"tailwindcss",
		"lua_ls",
		"pyright",
		"terraformls",
		"jsonls",
		"bashls",
		"yamlls",
	},
	automatic_installation = true, -- not the same as ensure_installed
})
