return {
    { "mg979/vim-visual-multi", event = "VeryLazy" },
    { "inkarkat/vim-ReplaceWithRegister", event = "VeryLazy" },
    { "windwp/nvim-ts-autotag", event = { "BufReadPost", "BufNewFile" }, dependencies = { "nvim-treesitter" } },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("config.plugins.auto-pairs")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("config.plugins.nvim-treesitter")
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("config.plugins.nvim-surround")
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },
}
