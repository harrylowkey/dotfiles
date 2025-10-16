return {
    { "rafamadriz/friendly-snippets" },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lsp.init")
        end,
    },
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
    {
        "nvimdev/lspsaga.nvim",
        branch = "main",
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
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     config = function()
    --         require("config.lsp.plugins.mason-nvim-dap")
    --     end,
    -- },
}
