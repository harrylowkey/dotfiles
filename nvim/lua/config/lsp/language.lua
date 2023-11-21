local lspconfig = require("lspconfig")
local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")
local handlers = require("config.lsp.utils/handlers")

lspconfig.cssls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.languages.cssls").on_attach,
  settings = require("config.lsp.languages.cssls").settings,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("config.lsp.languages.eslint").on_attach,
  settings = require("config.lsp.languages.eslint").settings,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.languages.jsonls").settings,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("config.lsp.languages.lua_ls").settings,
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  pyright = require("config.lsp.languages.python").pyright,
  filetypes = require("config.lsp.languages.python").filetypes,
  python = require("config.lsp.languages.python").python,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  settings = require("config.lsp.languages.yamlls").settings,
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
  settings = require("config.lsp.languages.typescript").settings,
  handlers = require("config.lsp.languages.typescript").handlers,
})
