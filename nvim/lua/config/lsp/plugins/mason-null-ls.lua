local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  ensure_installed = {
    "prettier",     -- ts/js formatter
    "stylua",       -- lua formatter
    "eslint_d",     -- ts/js linter
    "isort",        -- python formatter
    "ruff",         -- python linter & linter
    "beautysh",
  },
  automatic_installation = true,   -- not related to ensure_installed
})
