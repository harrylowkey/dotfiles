-- Global NeoVim variable
local icons = require("utils.icons")

NeoVim = {
    ui = {
        float = {
            border = "rounded",
        },
    },
    plugins = {
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
