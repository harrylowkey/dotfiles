return {
    {
        "neovim/nvim-lspconfig",
        -- LSP only matters once you open a real file, so defer the whole stack
        -- off the startup/dashboard path. mason + mason-lspconfig are ordered
        -- dependencies so their setup() runs before lspconfig's config.
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "williamboman/mason.nvim",
                config = function()
                    require("config.lsp.plugins.mason")
                end,
            },
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("config.lsp.plugins.mason-lspconfig")
                end,
            },
        },
        config = function()
            require("config.lsp.init")
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        branch = "main",
        cmd = "Lspsaga",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("config.lsp.plugins.lspsaga")
        end,
    },
    {
        "pmizio/typescript-tools.nvim",
        -- Loaded on demand when config.lsp.languages.typescript require()s it,
        -- which happens inside lspconfig's config on file open.
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("config.plugins.lint")
        end,
    },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     config = function()
    --         require("config.lsp.plugins.mason-nvim-dap")
    --     end,
    -- },
}
