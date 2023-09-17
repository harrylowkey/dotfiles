local null_ls = require("null-ls")
local on_attach = require("lsp.utils.on_attach")

local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

null_ls.setup({
	sources = {
		-- prettier
		formatting.prettier.with({
			extra_filetypes = { "toml" },
		}),

		-- lua
		formatting.stylua,

		-- python
		diagnostics.flake8,
		formatting.black.with({ extra_args = { "--fast" } }),
        formatting.isort,

		-- javascript
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),
	},
	on_attach = on_attach,
})
