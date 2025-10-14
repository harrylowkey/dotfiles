local capabilities = require("config.lsp.utils/capabilities")
local handlers = require("config.lsp.utils/handlers")

local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
end

local setting = {
    css = {
        lint = {
            unknownAtRules = "ignore",
        },
    },
    scss = {
        lint = {
            unknownAtRules = "ignore",
        },
    },
}

vim.lsp.config("cssls", {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = setting,
})

vim.lsp.enable({ "cssls" })
