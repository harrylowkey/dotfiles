local lspconfig = require("lspconfig")
local on_attach = require("lsp/on_attach")
local capabilities = require("lsp/capabilities")

lspconfig.lua_ls.setup({
   capabilities = capabilities,
   on_attach = on_attach,
   settings = {
      lua = {
         diagnostics = {
            globals = { "vim" },
         },
         workspace = {
            library = {
               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
               [vim.fn.stdpath("config") .. "/lua"] = true,
            },
         },
      },
   },
})
