local null_ls = require("null-ls")
local on_attach = require("config.lsp.utils.on_attach")

local formatting = null_ls.builtins.formatting     -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics   -- to setup linters
local code_actions = null_ls.builtins.code_actions -- to setup linters

null_ls.setup({
  sources = {
    diagnostics.cspell,
    code_actions.cspell,

    -- lua
    formatting.stylua,

    -- python
    diagnostics.ruff,
    formatting.ruff,
    formatting.isort,

    -- js/ts
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file(".eslintrc.js")
      end,
    }),
    code_actions.eslint_d,
    formatting.prettier,

    --sh
    formatting.beautysh,
  },
  on_attach = on_attach,
})
