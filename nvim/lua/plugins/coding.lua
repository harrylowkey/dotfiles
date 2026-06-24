local on_attach = require("config.lsp.utils/on_attach")

return {
    { "nvim-lua/plenary.nvim" },
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
        -- Maintained fork of the abandoned norcalli/nvim-colorizer.lua: matches
        -- the new setup({ filetypes, user_default_options }) API used in the
        -- config and drops the deprecated vim.tbl_flatten call.
        "catgoose/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("config.plugins.colorizer")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        event = "BufReadPost",
        dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
        config = function()
            require("config.plugins.ufo")
        end,
    }, -- folding
    {
        "ThePrimeagen/harpoon",
        -- Loaded on demand: the harpoon mappings require() it on keypress.
        lazy = true,
        config = function()
            require("config.plugins.harpoon")
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        -- Loaded on demand: the spectre mappings require() it on keypress.
        lazy = true,
        cmd = "Spectre",
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
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown" },
        opts = {},
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        config = function()
            require("render-markdown").setup()
        end,
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {},
        config = function()
            -- Use oxfmt if project has .oxfmtrc.json, otherwise prettier
            local web_formatter = function(bufnr)
                local dir = vim.fn.expand("#" .. bufnr .. ":p:h")
                local oxfmt_config = vim.fs.find(".oxfmtrc.json", { upward = true, path = dir })[1]
                if oxfmt_config then
                    return { "oxfmt" }
                end
                return { "prettier" }
            end

            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = web_formatter,
                    javascriptreact = web_formatter,
                    typescript = web_formatter,
                    typescriptreact = web_formatter,
                    vue = { "prettier" },
                    css = { "prettier" },
                    html = { "prettier" },
                    json = web_formatter,
                    jsonc = web_formatter,
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    python = { "isort", "ruff_format", "ruff_fix", "ruff_organize_imports" },
                },
                formatters = {
                    oxfmt = {
                        command = "oxfmt",
                        args = { "--stdin-filepath", "$FILENAME" },
                        stdin = true,
                        cwd = require("conform.util").root_file({ ".oxfmtrc.json" }),
                    },
                    prettier = {
                        prepend_args = function(_, ctx)
                            local prettier_config = vim.fs.find({
                                ".prettierrc",
                                ".prettierrc.json",
                                ".prettierrc.yml",
                                ".prettierrc.yaml",
                                ".prettierrc.json5",
                                ".prettierrc.js",
                                ".prettierrc.cjs",
                                ".prettierrc.mjs",
                                ".prettierrc.toml",
                                "prettier.config.js",
                                "prettier.config.cjs",
                                "prettier.config.mjs",
                            }, { upward = true, path = ctx.dirname })[1]

                            if prettier_config then
                                return { "--config", prettier_config }
                            end
                            return { "--tab-width", "4" }
                        end,
                    },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
        end,
    },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {
            config = {
                on_attach = on_attach,
                config = {
                    settings = {
                        ["csharp|formatting"] = {
                            dotnet_organize_imports_on_format = true,
                        },
                    },
                },
            },
        },
    },
}
