local capabilities = require("config.lsp.utils/capabilities")
local handlers = require("config.lsp.utils/handlers")

local on_attach = function(client, bufnr)
    -- Formatting is owned by conform/prettier, not the eslint LSP.
    client.server_capabilities.documentFormattingProvider = false
    -- The eslint server has no real hover; without this it answers Shift+K
    -- (Lspsaga hover_doc) with an empty result -> a "No information available"
    -- toast alongside the real tsserver hover. Let tsserver own hover.
    client.server_capabilities.hoverProvider = false
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

vim.lsp.config("eslint", {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = settings,
})

vim.lsp.enable({ "eslint" })
