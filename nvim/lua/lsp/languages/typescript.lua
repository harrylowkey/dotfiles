local typescript = require("typescript")
local on_attach = require("lsp/on_attach")
local capabilities = require("lsp/capabilities")

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})
