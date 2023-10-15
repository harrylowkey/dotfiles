return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
	{ "christoomey/vim-tmux-navigator" },
	{ "nvim-tree/nvim-tree.lua" },
}
