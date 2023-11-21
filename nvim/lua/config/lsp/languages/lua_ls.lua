local M = {}

M.settings = {
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

return M
