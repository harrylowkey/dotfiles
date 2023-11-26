return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>db",
                "<cmd> DapToggleBreakpoint <CR>",
                desc = "Debug Method",
                ft = "python",
            },
        },
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "nvim-dap", "rcarriga/nvim-dap-ui" },
        keys = {
            {
                "<leader>dpm",
                function()
                    require("dap-python").test_method()
                end,
                desc = "Debug Method",
                ft = "python",
            },
            {
                "<leader>dpc",
                function()
                    require("dap-python").test_class()
                end,
                desc = "Debug Class",
                ft = "python",
            },
        },
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end,
    },
}
