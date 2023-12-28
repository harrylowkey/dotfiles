local lspconfig = require("lspconfig")
local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")
local handlers = require("config.lsp.utils/handlers")

lspconfig.terraformls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
})
