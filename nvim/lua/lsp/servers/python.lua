local M = {}

M.pyright = { autoImportCompletion = true }
M.filetypes = { "python" }
M.python = {
		analysis = {
			autoImportCompletions = true,
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
			typeCheckingMode = "basic",
			diagnosticMode = "off",
		},
}

return M

