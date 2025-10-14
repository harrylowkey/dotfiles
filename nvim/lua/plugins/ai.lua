return {
    {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({})
        end,
    },
    {
        "Exafunction/codeium.vim",
        event = "BufEnter",
    },

    "greggh/claude-code.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
        require("config.claudecode")
    end,
    -- {
    --   "olimorris/codecompanion.nvim",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-treesitter/nvim-treesitter",
    --     "echasnovski/mini.diff",
    --     "stevearc/dressing.nvim",
    --     { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },       -- Optional: For prettier markdown rendering
    --   },
    --   config = function()
    --     require("config.plugins.codecompanion")
    --   end,
    -- },
}
