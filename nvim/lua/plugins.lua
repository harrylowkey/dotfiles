-- auto install packej if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	use({
		"christoomey/vim-tmux-navigator",
		lazy = false,
	}) -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("numToStr/Comment.nvim") -- commenting with gc
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("nvim-tree/nvim-web-devicons") -- vs-code like icons
	use("nvim-lualine/lualine.nvim") -- statusline
	use("ThePrimeagen/harpoon")

	-- colorschemes
	use({
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
			require("config.colorscheme")
		end,
		opts = {},
	})

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "cljoly/telescope-repo.nvim" },
		},
		config = function()
			require("plugins.telescope")
		end,
	}) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippetL3MON4D3/LuaSnip"s
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- formatter & linters
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

	-- enhanced lsp ui
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- typescript LSP
	use({
		"pmizio/typescript-tools.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
	})
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	use("mg979/vim-visual-multi")
	use("folke/todo-comments.nvim")
	use("folke/trouble.nvim")

	-- terminal
	use({ "akinsho/toggleterm.nvim" })

	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- dashboard
	use("goolord/alpha-nvim")

	-- folding
	use({
		"kevinhwang91/nvim-ufo",
		requires = {
			{ "kevinhwang91/promise-async" },
			{ "luukvbaal/statuscol.nvim" },
		},
	})

	-- colorize hexdecimal color code
	use("norcalli/nvim-colorizer.lua")

	-- indent blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- jump to word faster
	use("ggandor/lightspeed.nvim")

	use({
		"sunjon/shade.nvim",
		config = function()
			require("shade").setup()
			require("shade").toggle()
		end,
	})

	-- noice
	use({
		"folke/noice.nvim",
		lazy = false,
		requires = { { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
	})

	-- which-key
	use("folke/which-key.nvim")

	-- git
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- comment-box
	use("LudoPinelli/comment-box.nvim")

	-- zen mode
	use({
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		config = function()
			require("plugins.zen")
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
