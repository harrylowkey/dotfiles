local lspconfig = require("lspconfig")
local capabilities = require("config.lsp.utils/capabilities")
local handlers = require("config.lsp.utils/handlers")

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local settings = {
  codeAction = {
    disableRuleComment = {
      enable = true,
      location = "separateLine",
    },
    showDocumentation = {
      enable = true,
    },
  },
  codeActionOnSave = {
    enable = false,
    mode = "all",
  },
  format = true,
  nodePath = "",
  onIgnoredFiles = "off",
  packageManager = "npm",
  quiet = false,
  rulesCustomizations = {},
  run = "onType",
  useESLintClass = false,
  validate = "on",
  workingDirectory = {
    mode = "location",
  },
}

lspconfig.eslint.setup({
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = settings,
})
