local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]
local filter = require("lsp.utils.filter").filter
local filterReactDTS = require("lsp.utils.filterReactDTS").filterReactDTS

local M = {}

M.handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = NeoVim.ui.float.border,
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = NeoVim.ui.float.border }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = NeoVim.lsp.virtual_text }
	),
	["textDocument/definition"] = function(err, result, method, ...)
		P(result)
		if vim.tbl_islist(result) and #result > 1 then
			local filtered_result = filter(result, filterReactDTS)
			return baseDefinitionHandler(err, filtered_result, method, ...)
		end

		baseDefinitionHandler(err, result, method, ...)
	end,
}

M.settings = {
	separate_diagnostic_server = true,
	tsserver_file_preferences = {
		includeInlayParameterNameHints = "all",
		includeCompletionsForModuleExports = true,
		quotePreference = "auto",
	},
}

return M
