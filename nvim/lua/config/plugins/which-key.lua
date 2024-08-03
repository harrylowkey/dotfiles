local present, wk = pcall(require, "which-key")
if not present then
    return
end

wk.setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 4, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = { "<leader>" }, -- or specify a list manually
})

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

wk.add({
    { "<leader>/", group = "Nvim", nowait = false, remap = false },
    { "<leader>//", "<cmd>Alpha<CR>", desc = "open dashboard", nowait = false, remap = false },
    { "<leader>/d", "<cmd>Lazy<CR>", desc = "Lazy dashboard", nowait = false, remap = false },
    { "<leader>/s", "<cmd>Lazy sync<CR>", desc = "Lazy update plugins", nowait = false, remap = false },
    { "<leader>1", hidden = true, nowait = false, remap = false },
    { "<leader>2", hidden = true, nowait = false, remap = false },
    { "<leader>3", hidden = true, nowait = false, remap = false },
    { "<leader>4", hidden = true, nowait = false, remap = false },
    { "<leader>5", hidden = true, nowait = false, remap = false },
    { "<leader>6", hidden = true, nowait = false, remap = false },
    { "<leader>7", hidden = true, nowait = false, remap = false },
    { "<leader>8", hidden = true, nowait = false, remap = false },
    { "<leader>9", hidden = true, nowait = false, remap = false },
    { "<leader>?", "<cmd>Telescope help_tags<CR>", desc = "Telescope helps", nowait = false, remap = false },
    { "<leader>c", group = "colorscheme theme", nowait = false, remap = false },
    { "<leader>ct", "<cmd>Telescope colorscheme<CR>", desc = "color schemes", nowait = false, remap = false },
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Tree toggle", nowait = false, remap = false },
    { "<leader>f", group = "Telescope", nowait = false, remap = false },
    {
        "<leader>f/",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "search text in current file",
        nowait = false,
        remap = false,
    },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "list open buffers", nowait = false, remap = false },
    {
        "<leader>fc",
        "<cmd>Telescope grep_string<cr>",
        desc = "search text under cursor",
        nowait = false,
        remap = false,
    },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "search files", nowait = false, remap = false },
    {
        "<leader>fh",
        "<cmd>Telescope find_files hidden=true<cr>",
        desc = "search hidden files",
        nowait = false,
        remap = false,
    },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "telescope key maps config", nowait = false, remap = false },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "search text", nowait = false, remap = false },
    {
        "<leader>ft",
        "<cmd>lua vim.cmd('NvimTreeFocus');vim.cmd('Telescope find_files hidden=true')<cr>",
        desc = "search files in tree",
        nowait = false,
        remap = false,
    },
    { "<leader>g", group = "Git", nowait = false, remap = false },
    {
        "<leader>gA",
        "<cmd>!git add .<CR>",
        desc = "add all",
        nowait = false,
        remap = false,
    },
    {
        "<leader>gB",
        "<cmd>Telescope git_branches<CR>",
        desc = "branches",
        nowait = false,
        remap = false,
    },
    {
        "<leader>ga",
        "<cmd>!git add %:p<cr>",
        desc = "add current",
        nowait = false,
        remap = false,
    },
    {
        "<leader>gb",
        "<cmd>Gitsigns blame<CR>",
        desc = "blame",
        nowait = false,
        remap = false,
    },
    { "<leader>gd", group = "Git diff", nowait = false, remap = false },
    {
        "<leader>gdc",
        ":DiffviewClose<CR>",
        desc = "Close git diff",
        nowait = false,
        remap = false,
    },
    {
        "<leader>gdf",
        ":DiffviewFileHistory %<CR>",
        desc = "Git status current file",
        nowait = false,
        remap = false,
    },
    {
        "<leader>gdh",
        ":DiffviewFileHistory<CR>",
        desc = "Git status all files history",
        nowait = false,
        remap = false,
    },
    {
        "<leader>gdo",
        ":DiffviewOpen<CR>",
        desc = "Git status",
        nowait = false,
        remap = false,
    },
    { "<leader>gl", group = "Log", nowait = false, remap = false },
    {
        "<leader>gla",
        '<cmd>lua require("config.plugins.telescope").my_git_commits()<CR>',
        desc = "commits (Telescope)",
        nowait = false,
        remap = false,
    },
    {
        "<leader>glc",
        '<cmd>lua require("config.plugins.telescope").my_git_bcommits()<CR>',
        desc = "buffer commits (Telescope)",
        nowait = false,
        remap = false,
    },
    { "<leader>gm", desc = "blame line", nowait = false, remap = false },
    { "<leader>k", group = "K9s", nowait = false, remap = false },
    { "<leader>k9", "<cmd>lua _k9s_toggle()<CR>", desc = "k9s toggle", nowait = false, remap = false },
    { "<leader>l", group = "Lazy Git & LSP Saga", nowait = false, remap = false },
    {
        "<leader>lc",
        "<cmd>Lspsaga show_cursor_diagnostics<CR>",
        desc = "diagnostics under cursor",
        nowait = false,
        remap = false,
    },
    { "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", desc = "lazy git toggle", nowait = false, remap = false },
    {
        "<leader>ll",
        "<cmd>Lspsaga show_line_diagnostics<CR>",
        desc = "diagnostics current line",
        nowait = false,
        remap = false,
    },
    { "<leader>m", group = "Markdown & Harpoon", nowait = false, remap = false },
    { "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", desc = "markdown preview toggle", nowait = false, remap = false },
    {
        "<leader>mf",
        ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
        desc = "harpoon quick list marked files",
        nowait = false,
        remap = false,
    },
    { "<leader>mm", ":Telescope harpoon marks<CR>", desc = "harpoon list marked files", nowait = false, remap = false },
    {
        "<leader>mn",
        ":lua require('harpoon.ui').nav_next()<CR>",
        desc = "harpoon open next marked file",
        nowait = false,
        remap = false,
    },
    {
        "<leader>mp",
        ":lua require('harpoon.ui').nav_prev()<CR>",
        desc = "harpoon open previous marked file",
        nowait = false,
        remap = false,
    },
    { "<leader>r", group = "Rename text", nowait = false, remap = false },
    { "<leader>rn", "lua vim.lsp.buf.rename()<CR>", desc = "rename", nowait = false, remap = false },
    { "<leader>s", group = "Search", nowait = false, remap = false },
    {
        "<leader>sc",
        '<cmd>lua require("config.plugins.telescope").command_history()<CR>',
        desc = "command history",
        nowait = false,
        remap = false,
    },
    { "<leader>sf", "<cmd>Telescope oldfiles hidden=true<CR>", desc = "file history", nowait = false, remap = false },
    { "<leader>t", group = "Todo & Trouble", nowait = false, remap = false },
    {
        "<leader>tc",
        ":TroubleToggle document_diagnostics<CR>",
        desc = "trouble diagnostics current file",
        nowait = false,
        remap = false,
    },
    { "<leader>td", ":TodoTelescope<CR>", desc = "todo toggle", nowait = false, remap = false },
    { "<leader>tt", ":TroubleToggle<CR>", desc = "trouble toggle", nowait = false, remap = false },
    {
        "<leader>tw",
        ":TroubleToggle workspace_diagnostics<CR>",
        desc = "trouble diagnostics working project",
        nowait = false,
        remap = false,
    },
}, opts)

local visual_opts = {
    mode = "v", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

wk.add({
    {
        mode = { "v" },
        { "<leader>a", group = "Actions", nowait = false, remap = false },
        { "<leader>ac", desc = "comment box", nowait = false, remap = false },
        { "<leader>c", group = "LSP", nowait = false, remap = false },
        { "<leader>ca", desc = "range code action", nowait = false, remap = false },
        { "<leader>cf", desc = "range format", nowait = false, remap = false },
        { "<leader>g", group = "Git", nowait = false, remap = false },
        { "<leader>gh", group = "Hunk", nowait = false, remap = false },
        { "<leader>ghr", desc = "reset hunk", nowait = false, remap = false },
        { "<leader>ghs", desc = "stage hunk", nowait = false, remap = false },
        { "<leader>p", group = "Project", nowait = false, remap = false },
        { "<leader>pr", desc = "refactor", nowait = false, remap = false },
        { "<leader>s", "<cmd>'<,'>sort<CR>", desc = "sort", nowait = false, remap = false },
        { "<leader>t", group = "Table Mode", nowait = false, remap = false },
        { "<leader>tt", desc = "tableize", nowait = false, remap = false },
    },
}, visual_opts)
