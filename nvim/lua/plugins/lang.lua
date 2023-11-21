return {
	{ "neovim/nvim-lspconfig" },
	{ "rafamadriz/friendly-snippets" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("config.lsp.plugins.mason")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("config.lsp.plugins.mason-lspconfig")
		end,
	},
	{
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("config.lsp.plugins.mason-null-ls")
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("config.lsp.plugins.null-ls")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("config.lsp.plugins.lspsaga")
		end,
	},
}
