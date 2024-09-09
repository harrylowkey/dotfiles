return {
    { "nvim-lua/plenary.nvim" },
    { "LudoPinelli/comment-box.nvim" },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
    },
    {
        "sunjon/shade.nvim",
        config = function()
            require("shade").setup()
            require("shade").toggle()
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("config.plugins.colorizer")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
        config = function()
            require("config.plugins.ufo")
        end,
    }, -- folding
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("config.plugins.harpoon")
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("spectre").setup({
                replace_engine = {
                    ["sed"] = {
                        cmd = "sed",
                        args = {
                            "-i",
                            "",
                            "-E",
                        },
                    },
                },
            })
        end,
    },
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
    {
        "tamton-aquib/duck.nvim",
        config = function()
            vim.keymap.set("n", "<leader>dd", function()
                require("duck").hatch()
            end, { desc = "Release duck" })
            vim.keymap.set("n", "<leader>dk", function()
                require("duck").cook()
            end, { desc = "Cook duck" })
        end,
    },
    {
        "vhyrro/luarocks.nvim",
        opts = {
            rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua", "rest.nvim" }, -- Specify LuaRocks packages to install
        },
        priority = 1000,
        config = true,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {},
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        config = function()
            require("render-markdown").setup()
        end,
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
    -- {
    --     "rest-nvim/rest.nvim",
    --     ft = "http",
    --     dependencies = { "luarocks.nvim" },
    --     config = function()
    --         require("config.plugins.rest")
    --     end,
    -- },
}
