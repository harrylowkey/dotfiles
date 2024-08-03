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
        config = function()
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
