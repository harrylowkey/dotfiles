local lspconfig = require("lspconfig")
local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")
local handlers = require("config.lsp.utils/handlers")

local settings = {
  json = {
    schemas = {
      {
        fileMatch = { "package.json" },
        url = "https://json.schemastore.org/package.json",
      },
      {
        fileMatch = { "tsconfig*.json" },
        url = "https://json.schemastore.org/tsconfig.json",
      },
      {
        fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
        url = "https://json.schemastore.org/prettierrc.json",
      },
      {
        fileMatch = { ".eslintrc", ".eslintrc.json" },
        url = "https://json.schemastore.org/eslintrc.json",
      },
      {
        fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
        url = "https://json.schemastore.org/babelrc.json",
      },
      {
        fileMatch = { "lerna.json" },
        url = "https://json.schemastore.org/lerna.json",
      },
      {
        fileMatch = { "now.json", "vercel.json" },
        url = "https://json.schemastore.org/now.json",
      },
      {
        fileMatch = { "ecosystem.json" },
        url = "https://json.schemastore.org/pm2-ecosystem.json",
      },
    },
  },
}

lspconfig.jsonls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = settings,
})
