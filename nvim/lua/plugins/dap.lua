return {
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })
        end,
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
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
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"
            require("dap-python").setup(path)
        end,
    },
}
