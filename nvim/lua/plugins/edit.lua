return {
    { "mg979/vim-visual-multi" },
    { "inkarkat/vim-ReplaceWithRegister" },
    { "windwp/nvim-ts-autotag",          dependencies = { "nvim-treesitter" } },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("config.plugins.auto-pairs")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
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
        config = function()
            require("Comment").setup()
        end,
    },
}
