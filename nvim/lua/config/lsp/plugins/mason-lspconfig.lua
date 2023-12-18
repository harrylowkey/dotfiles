local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "html",
        "cssls",
        "eslint",
        "tailwindcss",
        "lua_ls",
        "pyright",
        "terraformls",
        "jsonls",
        "bashls",
        "tsserver",
        "yamlls",
    },
    automatic_installation = true, -- not related to ensure_installed
})
