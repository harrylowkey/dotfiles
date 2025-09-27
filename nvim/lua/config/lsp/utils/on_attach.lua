local keymap = vim.keymap -- for conciseness

return function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

    keymap.set("n", "ge", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- go to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", vim.tbl_extend("force", opts, { desc = "Outline" })) -- see file outline
    keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

    keymap.set(
        "n",
        "<leader>ca",
        "<cmd>Lspsaga code_action<CR>",
        vim.tbl_extend("force", opts, { desc = "Code Action" }) -- see available code actions
    )
end
