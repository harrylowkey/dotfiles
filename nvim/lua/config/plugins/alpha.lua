local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local theme = require("alpha.themes.theta")

local config = theme.config
local logo = [[

     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

]]

local function getGreeting(name)
    local tableTime = os.date("*t")
    local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
    local hour = tableTime.hour
    local greetingsTable = {
        [1] = "  Sleep well",
        [2] = "  Good morning",
        [3] = "  Good afternoon",
        [4] = "  Good evening",
        [5] = "󰖔  Good night",
    }
    local greetingIndex = 0
    if hour == 23 or hour < 7 then
        greetingIndex = 1
    elseif hour < 12 then
        greetingIndex = 2
    elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
    elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
    elseif hour >= 21 then
        greetingIndex = 5
    end
    return "\t" .. greetingsTable[greetingIndex] .. ", " .. name .. "\t" .. datetime
end

local userName = "harry"
local greeting = getGreeting(userName)
local header = {
    type = "text",
    val = vim.split(logo .. "\n" .. greeting, "\n"),
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow",
    },
}
local buttons = {
    type = "group",
    val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("m", "󰂖  Mason", ":Mason<CR>"),
        dashboard.button("z", "󰂖  Lazy", ":Lazy<CR>"),
        dashboard.button("u", "󰂖  Update plugins", ":Lazy sync<CR>"),
        dashboard.button("i", "󰂖  Update lsp", ":MasonUpdate<CR>"),
        dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
    },
    position = "center",
}

config.layout[2] = header
config.layout[6] = buttons
alpha.setup(config)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
