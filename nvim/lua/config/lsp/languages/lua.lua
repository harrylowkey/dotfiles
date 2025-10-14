local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")
local handlers = require("config.lsp.utils/handlers")

local settings = {
    Lua = {
        completion = { callSnippet = "Replace" },
        runtime = { version = "LuaJIT" },
        diagnostics = {
            enable = true,
            globals = { "vim", "bit", "describe", "it", "before_each", "after_each" },
        },
        workspace = {
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
            },
        },
    },
}

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    settings = settings,
})

vim.lsp.enable({ "lua_ls" })
