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
    separate_diagnostic_server = false,
    tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
    },
}

local custom_on_attach = function(client, bufnr)
    -- Formatting is owned by conform/prettier (see plugins/coding.lua). Disable
    -- tsserver's formatter so it can't run a second format-on-save and reformat
    -- against prettier/eslint (e.g. empty braces -> `{ }` instead of `{}`).
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)

    local opts = { silent = true }
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>oi", ":TSToolsOrganizeImports<CR>", opts)
    keymap.set("n", "<leader>si", ":TSToolsSortImports<CR>", opts)
    keymap.set("n", "<leader>ru", ":TSToolsRemoveUnused<CR>", opts)
    keymap.set("n", "<leader>rn", ":TSToolsRenameFile<CR>", opts)
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
