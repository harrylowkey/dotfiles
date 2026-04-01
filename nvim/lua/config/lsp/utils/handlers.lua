local handlers = {
    ["textDocument/hover"] = vim.lsp.buf.hover,
    ["textDocument/signatureHelp"] = vim.lsp.buf.signature_help,
}

-- Configure hover and signature help borders globally
vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
    config = config or {}
    config.border = NeoVim.ui.float.border
    config.silent = true
    return vim.lsp.handlers.hover(err, result, ctx, config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
    config = config or {}
    config.border = NeoVim.ui.float.border
    return vim.lsp.handlers.signature_help(err, result, ctx, config)
end

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = NeoVim.lsp.virtual_text,
})

return handlers
