return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("config.plugins.alpha")
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = {
                marks = true,
                registers = true,
                spelling = { enabled = true, suggestions = 20 },
                presets = {
                    operators = false,
                    motions = false,
                    windows = false,
                    nav = false,
                    z = false,
                    g = false,
                },
            },
            icons = {
                breadcrumb = ">>",
                separator = "->",
                group = "+",
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 4,
                align = "left",
            },
            show_help = true,
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            require("config.plugins.which-key")
        end,
    },
    { "echasnovski/mini.nvim", version = false },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
