-- Global NeoVim variable
local icons = require("utils.icons")

NeoVim = {
    ui = {
        float = {
            border = "rounded",
        },
    },
    plugins = {
        ai = {
            chatgpt = {
                enabled = false,
            },
            codeium = {
                enabled = true,
            },
            copilot = {
                enabled = false,
            },
            tabnine = {
                enabled = false,
            },
        },
        rooter = {
            -- Removing package.json from list in Monorepo Frontend Project can be helpful
            -- By that your live_grep will work related to whole project, not specific package
            patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }, -- Default
        },
        zen = {
            alacritty_enabled = false,
            kitty_enabled = false,
            wezterm_enabled = true,
            enabled = true, -- sync after change
        },
    },
    -- Please keep it
    icons = icons,
    lsp = {
        virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
    },
}
