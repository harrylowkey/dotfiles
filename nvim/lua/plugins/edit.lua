return {
	{ "mg979/vim-visual-multi" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter" } },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config.plugins.treesitter")
		end,
	},
	{ "tpope/vim-surround" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	{ "inkarkat/vim-ReplaceWithRegister" },
	{ "numToStr/Comment.nvim" },
}
