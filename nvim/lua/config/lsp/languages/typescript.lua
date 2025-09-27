local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")

local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]
local filterReactDTS = require("config.lsp.utils.filterReactDTS").filterReactDTS
local baseHandlers = require("config.lsp.utils.handlers")

local extendedHandlers = vim.tbl_extend("force", baseHandlers, {
    ["textDocument/definition"] = function(err, result, ctx, config)
        if not result then
            return
        end

        local results = type(result) == "table" and result or { result }

        if #results > 1 then
            local filtered_result = vim.tbl_filter(filterReactDTS, results)
            return baseDefinitionHandler(err, filtered_result, ctx, config)
        end

        return baseDefinitionHandler(err, result, ctx, config)
    end,
})

local settings = {
    separate_diagnostic_server = true,
    tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
    },
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.server_capabilities and client.server_capabilities.documentFormattingProvider == true
        end,
        bufnr = bufnr,
    })
end

local custom_on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    on_attach(client, bufnr)

    local opts = { silent = true }
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts)
    keymap.set("n", "<leader>si", ":TSToolsSortImports<CR>", opts)
    keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>", opts)
    keymap.set("n", "<leader>rn", ":TSToolsRenameFile<CR>", opts)

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

require("typescript-tools").setup({
    capabilities = capabilities,
    on_attach = custom_on_attach,
    settings = settings,
    handlers = extendedHandlers,
})

local function set_filetype_options(filetype)
    vim.cmd(string.format(
        [[
        au FileType %s set noexpandtab
        au FileType %s set autoindent
        au FileType %s set smartindent
        au FileType %s set shiftwidth=4
        au FileType %s set softtabstop=4
        au FileType %s set tabstop=4
    ]],
        filetype,
        filetype,
        filetype,
        filetype,
        filetype,
        filetype
    ))
end

-- set_filetype_options("typescript")
