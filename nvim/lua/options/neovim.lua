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
        -- Off: diagnostics render via virtual_lines (the red below-line text in
        -- config.lsp.plugins.lsp-lines). Having both on double-renders each one.
        virtual_text = false,
    },
}
