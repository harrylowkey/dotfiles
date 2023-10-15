return {
	{ "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	{ "onsails/lspkind.nvim" },
	{
		"nvimdev/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require("config.colorscheme")
		end,
		opts = {},
	},
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-lualine/lualine.nvim" }, -- vs-code like icons for autocompletion
}
