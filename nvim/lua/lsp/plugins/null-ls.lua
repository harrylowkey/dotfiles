local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(current_client, bufnr)
	if current_client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

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

		-- javascript
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),
	},
	on_attach = on_attach,
})
