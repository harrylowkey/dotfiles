local keymap = vim.keymap -- for conciseness

return function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	if client.name == "typescript-tools" then
		keymap.set("n", "gD", ":TSToolsGoToSourceDefinition<CR>", opts) -- go to declaration
		keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts) -- sorts and removes unused imports
		keymap.set("n", "<leader>si", ":TSToolsSortImports<CR>", opts)
		keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>", opts)
		keymap.set("n", "<leader>fe", ":TSToolsFixAll<CR>", opts)
		keymap.set("n", "<leader>rui", ":TSToolsRemoveUnusedImports<CR>", opts)
	end
end
