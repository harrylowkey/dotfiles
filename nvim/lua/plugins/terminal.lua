return {
	{ "szw/vim-maximizer", cmd = "MaximizerToggle", keys = { "<leader>m" } },
	{
		"akinsho/toggleterm.nvim",
		-- <leader>3/4 use :ToggleTerm; <leader>lg/k9 require() toggleterm from
		-- their wrapper fns, which also triggers the load.
		cmd = "ToggleTerm",
		keys = { "<leader>3", "<leader>4", "<leader>lg", "<leader>k9" },
		config = function()
			require("config.plugins.toggle-term")
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle" },
		keys = { "<leader>tt", "<leader>tw", "<leader>tc" },
		config = function()
			require("config.plugins.trouble")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("config.plugins.todo-comment")
		end,
	},
}
