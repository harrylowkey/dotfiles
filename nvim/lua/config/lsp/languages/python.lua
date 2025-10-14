local capabilities = require("config.lsp.utils/capabilities")
local on_attach = require("config.lsp.utils/on_attach")
local handlers = require("config.lsp.utils/handlers")

local pyright = { autoImportCompletion = true }
local filetypes = { "python" }
local python = {
    analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
        diagnosticMode = "off",
    },
}

vim.lsp.config("pyright", {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            },
        },
    },
    capabilities = capabilities,
    handlers = handlers,
    on_attach = on_attach,
    pyright = pyright,
    filetypes = filetypes,
    python = python,
})
vim.lsp.enable({ "pyright" })

-- Override the nvim python.vim plugin
-- located at /opt/homebrew/Cellar/neovim/0.9.4/share/nvim/runtime/ftplugin/python.vim

-- Noted: edited directly in above file, otherwise need to manually set
-- local function set_filetype_options(filetype)
--     vim.cmd(string.format(
--         [[
--         au FileType %s set expandtab
--         au FileType %s set autoindent
--         au FileType %s set smartindent
--         au FileType %s set shiftwidth=2
--         au FileType %s set softtabstop=2
--         au FileType %s set tabstop=2
--     ]],
--         filetype,
--         filetype,
--         filetype,
--         filetype,
--         filetype,
--         filetype
--     ))
-- end
-- set_filetype_options("python")
