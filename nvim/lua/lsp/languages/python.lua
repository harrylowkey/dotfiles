local lspconfig = require("lspconfig")
local on_attach = require("lsp/on_attach")
local capabilities = require("lsp/capabilities")

lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "python" },
	pyright = { autoImportCompletion = true },
	python = {
		analysis = {
			autoImportCompletions = true,
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
			typeCheckingMode = "basic",
			diagnosticMode = "off",
		},
	},
})
