return {
    { "nvim-tree/nvim-web-devicons" },
    { "onsails/lspkind.nvim" },
    {
        "folke/noice.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("config.plugins.noice")
        end,
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                style = "deep",
            })
            require("onedark").load()
        end,
        opts = {},
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.plugins.lualine")
        end,
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({ -- Optional, you don't have to run setup.
                groups = {        -- table: default groups
                    "Normal",
                    "NormalNC",
                    "Comment",
                    "Constant",
                    "Special",
                    "Identifier",
                    "Statement",
                    "PreProc",
                    "Type",
                    "Underlined",
                    "Todo",
                    "String",
                    "Function",
                    "Conditional",
                    "Repeat",
                    "Operator",
                    "Structure",
                    "LineNr",
                    "NonText",
                    "SignColumn",
                    "CursorLine",
                    "CursorLineNr",
                    "StatusLine",
                    "StatusLineNC",
                    "EndOfBuffer",
                },
                extra_groups = {}, -- table: additional groups that should be cleared
                exclude_groups = {}, -- table: groups you don't want to clear
            })
        end,
    },
    -- animation
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.scroll = {
                enable = false,
            }
            opts.cursor = {
                enable = false,
            }
        end,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            plugins = {
                gitsigns = true,
                tmux = true,
                kitty = { enabled = false, font = "+2" },
            },
        },
        keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            require("config.plugins.indent-blankline")
        end,
    },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = "VeryLazy",
        opts = {},
        config = function()
            require("config.plugins.indent-scope")
        end,
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}
