local keymap = vim.keymap -- for conciseness
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  client.server_capabilities.document_formatting = true

  keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)                   -- show definition, references
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)    -- go to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)          -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

  keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)             -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)   -- show  diagnostics for line
  keymap.set("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor

  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)            -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)            -- jump to next diagnostic in buffer

  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                        -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)                  -- see outline on right hand side

  if client.name == "typescript-tools" then
    keymap.set("n", "gD", ":TSToolsGoToSourceDefinition<CR>", opts)    -- go to declaration
    keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts) -- sorts and removes unused imports
    keymap.set("n", "<leader>si", ":TSToolsSortImports<CR>", opts)
    keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>", opts)
    keymap.set("n", "<leader>fe", ":TSToolsFixAll<CR>", opts)
    keymap.set("n", "<leader>rui", ":TSToolsRemoveUnusedImports<CR>", opts)
  end

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					filter = function(_client)
						return _client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end

	if client.server_capabilities.document_formatting then
		if vim.bo.filetype == "org" then
			return
		end
		vim.api.nvim_create_autocmd("BufWritePre", {
			command = "lua vim.lsp.buf.format({ timeout_ms = 5000 })",
			group = vim.api.nvim_create_augroup("LSPFormat", { clear = true }),
		})
	else
		vim.b.document_formatting = client.server_capabilities.document_formatting
	end
end
