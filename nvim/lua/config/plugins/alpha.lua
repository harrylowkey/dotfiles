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
    local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
    local hour = tableTime.hour
    local greetingsTable = {
        [1] = "Sleep well",
        [2] = "Good morning",
        [3] = "Good afternoon",
        [4] = "Good evening",
        [5] = "Good night",
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
        dashboard.button("f", ">> Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", ">> Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("m", ">> Mason", ":Mason<CR>"),
        dashboard.button("z", ">> Lazy", ":Lazy<CR>"),
        dashboard.button("u", ">> Update plugins", ":Lazy sync<CR>"),
        dashboard.button("i", ">> Update lsp", ":MasonUpdate<CR>"),
        dashboard.button("q", ">> Quit NVIM", ":qa<CR>"),
    },
    position = "center",
}

-- Rebuild mru section without file icons
local section_mru = {
    type = "group",
    val = {
        {
            type = "text",
            val = "Recent files",
            opts = { hl = "SpecialComment", position = "center" },
        },
        { type = "padding", val = 1 },
        {
            type = "group",
            val = function()
                local oldfiles = {}
                for _, v in pairs(vim.v.oldfiles) do
                    if #oldfiles == 5 then break end
                    if vim.fn.filereadable(v) == 1 and not v:find("COMMIT_EDITMSG") then
                        oldfiles[#oldfiles + 1] = v
                    end
                end
                local tbl = {}
                for i, fn in ipairs(oldfiles) do
                    local short_fn = vim.fn.fnamemodify(fn, ":.")
                    tbl[i] = dashboard.button(tostring(i - 1), "  " .. short_fn, "<cmd>e " .. vim.fn.fnameescape(fn) .. " <CR>")
                end
                return tbl
            end,
        },
    },
}

config.layout[2] = header
config.layout[4] = section_mru
config.layout[6] = buttons
alpha.setup(config)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
