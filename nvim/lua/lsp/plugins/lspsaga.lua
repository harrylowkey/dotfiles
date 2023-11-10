local saga = require("lspsaga")

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		edit = "<CR>",
	},
	symbol_in_winbar = {
		enable = true,
	},
	ui = {
		border = "single",
		devicon = true,
		title = true,
		expand = "⊞",
		collapse = "⊟",
		code_action = "💡",
		actionfix = " ",
		lines = { "┗", "┣", "┃", "━", "┏" },
		imp_sign = "󰳛 ",
		kind = {},
		colors = {
			normal_bg = "#022746",
		},
	},
	rename = {
		quit = "<C-c>",
		exec = "<CR>",
		mark = "x",
		confirm = "<CR>",
		in_select = false,
	},
})
