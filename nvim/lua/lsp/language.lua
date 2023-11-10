local mason = require("mason")
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local capabilities = require("lsp/utils/capabilities")
local on_attach = require("lsp/utils/on_attach_helper")
local handlers = require("lsp/utils/handlers")

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

mason_null_ls.setup({
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua",   -- lua formatter
    "eslint_d", -- ts/js linter
    "black",
    "flake8",
    "isort",
    -- "mypy",
    -- "ruff",
  },
  automatic_installation = true,
})

-- Order matters

lspconfig.cssls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.languages.cssls").on_attach,
  settings = require("lsp.languages.cssls").settings,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = require("lsp.languages.eslint").on_attach,
  settings = require("lsp.languages.eslint").settings,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.languages.jsonls").settings,
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = require("lsp.languages.lua_ls").settings,
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  pyright = require("lsp.languages.python").pyright,
  filetypes = require("lsp.languages.python").filetypes,
  python = require("lsp.languages.python").python,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  settings = require("lsp.languages.yamlls").settings,
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
  settings = require("lsp.languages.typescript").settings,
  handlers = require("lsp.languages.typescript").handlers,
})
