local ts = require("nvim-treesitter")

ts.setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Install parsers
ts.install({
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
})

-- Enable treesitter highlighting
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "json", "javascript", "typescript", "typescriptreact", "javascriptreact",
        "tsx", "yaml", "html", "css", "markdown", "svelte", "graphql",
        "bash", "lua", "vim", "dockerfile", "dart", "python", "xml", "http",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
