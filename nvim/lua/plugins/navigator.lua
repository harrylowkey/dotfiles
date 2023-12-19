return {
    { "christoomey/vim-tmux-navigator" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("config.plugins.nvim-tree")
        end,
        requires = {
            { "nvim-tree/nvim-web-devicons" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "cljoly/telescope-repo.nvim",
        },
        config = function()
            require("config.plugins.telescope")
        end,
    },
}
