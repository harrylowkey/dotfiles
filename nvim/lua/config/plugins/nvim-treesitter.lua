local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
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
    },
    auto_install = true,
})
