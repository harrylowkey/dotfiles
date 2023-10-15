return {
	{ "nvim-lua/plenary.nvim" },
	{ "LudoPinelli/comment-box.nvim" },
	{
		"sunjon/shade.nvim",
		config = function()
			require("shade").setup()
			require("shade").toggle()
		end,
	},
	{ "ggandor/lightspeed.nvim" }, -- jump to word faster
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "norcalli/nvim-colorizer.lua" },
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
	}, -- folding
	{ "ThePrimeagen/harpoon" },
}
