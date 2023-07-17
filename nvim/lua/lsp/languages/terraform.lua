local lspconfig = require("lspconfig")
local on_attach = require("lsp/on_attach")
local capabilities = require("lsp/capabilities")

lspconfig.terraformls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
