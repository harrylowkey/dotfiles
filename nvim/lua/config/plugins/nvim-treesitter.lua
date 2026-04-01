require("nvim-treesitter").setup()

-- Install missing parsers on startup (silent, async)
local ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "dart",
    "python",
    "xml",
    "http",
}

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        local installed = require("nvim-treesitter.config").get_installed()
        local to_install = vim.tbl_filter(function(lang)
            return not vim.list_contains(installed, lang)
        end, ensure_installed)
        if #to_install > 0 then
            require("nvim-treesitter").install(to_install)
        end
    end,
})

-- Enable treesitter-based highlighting for all filetypes
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
