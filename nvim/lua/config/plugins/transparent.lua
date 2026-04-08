require("transparent").setup({
    extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeWinSeparator",
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopePromptBorder",
        "TelescopeResultsNormal",
        "TelescopeResultsBorder",
        "TelescopePreviewNormal",
        "TelescopePreviewBorder",
        "LspFloatWinNormal",
        "WhichKeyFloat",
    },
    exclude_groups = {
        "CursorLine",
        "CursorLineNr",
    },
})

require("transparent").clear_prefix("lualine")
require("transparent").clear_prefix("NvimTree")
