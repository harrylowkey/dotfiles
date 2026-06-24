return {
    {
        "hrsh7th/nvim-cmp",
        -- Load the whole completion stack only when you start typing (or open
        -- the cmdline), instead of at startup. All sources + LuaSnip are
        -- dependencies, so they defer with it.
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("config.plugins.lua_snip")
                end,
            },
        },
        config = function()
            require("config.plugins.nvim-cmp")
        end,
    },
}
