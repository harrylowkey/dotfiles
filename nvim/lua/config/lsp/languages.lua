local lspconfig = require("lspconfig")
local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")
local handlers = require("config.lsp.utils/handlers")

lspconfig.cssls.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = require("config.lsp.lsps.cssls").on_attach,
	settings = require("config.lsp.lsps.cssls").settings,
})

lspconfig.eslint.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = require("config.lsp.lsps.eslint").on_attach,
	settings = require("config.lsp.lsps.eslint").settings,
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = on_attach,
	settings = require("config.lsp.lsps.jsonls").settings,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = on_attach,
	settings = require("config.lsp.lsps.lua_ls").settings,
})

lspconfig.pyright.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = on_attach,
	pyright = require("config.lsp.lsps.python").pyright,
	filetypes = require("config.lsp.lsps.python").filetypes,
	python = require("config.lsp.lsps.python").python,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	settings = require("config.lsp.lsps.yamlls").settings,
})

for _, server in ipairs({ "html", "dartls", "terraformls", "bashls" }) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers,
	})
end

require("typescript-tools").setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = require("config.lsp.lsps.typescript").settings,
	handlers = require("config.lsp.lsps.typescript").handlers,
})
