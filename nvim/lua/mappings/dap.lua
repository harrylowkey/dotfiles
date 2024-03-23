local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap(
    "n",
    "<leader>dap",
    ":lua require('dap').continue() <CR>",
    vim.tbl_extend("force", opts, { desc = "Start Debugging" })
)
keymap(
    "n",
    "<leader>dam",
    ":lua require('dap-python').test_method() <CR>",
    vim.tbl_extend("force", opts, { desc = "Debug closest method above the cursor." })
)
keymap(
    "n",
    "<leader>dac",
    ":lua require('dap-python').test_class() <CR>",
    vim.tbl_extend("force", opts, { desc = "Debug closest class above the cursor." })
)

vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
    require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
    require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
    require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
    require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
    require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
    require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
    require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
    require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)
