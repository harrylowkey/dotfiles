local lualine = require("lualine")

-- stylua: ignore
local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",

        section_separators = "",
        theme = "onedark",
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    function()
        return "▊"
    end,
    color = { fg = colors.blue },   -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
    -- mode component
    function()
        return ""
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
})

ins_left({
    "branch",
    icon = "",
    color = { fg = colors.violet, gui = "bold" },
})

ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = "bold" },
})

ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
    function()
        return "%="
    end,
})

-- Add components to right sections
ins_right(require("lazyvim.util").lualine.cmp_source("codeium"))

ins_right({ "location" })

ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_right({
    "diff",
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = "󰝤 ", removed = " " },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
})

ins_right({
    function()
        return "▊"
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
