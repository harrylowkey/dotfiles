local lspconfig = require("lspconfig")
local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")
local handlers = require("config.lsp.utils/handlers")

local pyright = { autoImportCompletion = true }
local filetypes = { "python" }
local python = {
  analysis = {
    autoImportCompletions = true,
    autoSearchPaths = true,
    useLibraryCodeForTypes = true,
    typeCheckingMode = "basic",
    diagnosticMode = "off",
  },
}

lspconfig.pyright.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  pyright = pyright,
  filetypes = filetypes,
  python = python,
})
