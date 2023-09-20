local present, wk = pcall(require, "which-key")
if not present then
	return
end

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = false, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = NeoVim.ui.float.border or "rounded", -- none, single, double, shadow, rounded
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 4, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	-- triggers = "auto", -- automatically setup triggers
	triggers = { "<leader>" }, -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
	mode = "v", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
	-- ignore
	["1"] = "which_key_ignore",
	["2"] = "which_key_ignore",
	["3"] = "which_key_ignore",
	["4"] = "which_key_ignore",
	["5"] = "which_key_ignore",
	["6"] = "which_key_ignore",
	["7"] = "which_key_ignore",
	["8"] = "which_key_ignore",
	["9"] = "which_key_ignore",

	-- single
	["?"] = { "<cmd>Telescope help_tags<CR>", "Telescope helps" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Tree toggle" },

	["/"] = {
		name = "Nvim",
		["/"] = { "<cmd>Alpha<CR>", "open dashboard" },
		c = { "<cmd>e $MYVIMRC<CR>", "open config" },
		i = { "<cmd>PackerStatus<CR>", "manage plugins" },
		u = { "<cmd>PackerSync<CR>", "update plugins" },
		s = {
			name = "Session",
			c = { "<cmd>SessionManager load_session<CR>", "choose session" },
			r = { "<cmd>SessionManager delete_session<CR>", "remove session" },
			d = { "<cmd>SessionManager load_current_dir_session<CR>", "load current dir session" },
			l = { "<cmd>SessionManager load_last_session<CR>", "load last session" },
			s = { "<cmd>SessionManager save_current_session<CR>", "save session" },
		},
	},

	a = {
		name = "Actions",
		b = { "<cmd>Telescope colorscheme<CR>", "color schemes" },
	},

	c = {
		name = "Comment box",
		b = { "comment box" },
	},

	--  ╭──────────────────────────────────────────────────────────╮
	--  │ 	d = {                                                 │
	--  │ 		name = "debug",                                   │
	--  │ 		a = { "attach" },                                 │
	--  │ 		b = { "breakpoint" },                             │
	--  │ 		c = { "continue" },                               │
	--  │ 		c = { "close ui" },                               │
	--  │ 		d = { "continue" },                               │
	--  │ 		h = { "visual hover" },                           │
	--  │ 		i = { "step into" },                              │
	--  │ 		o = { "step over" },                              │
	--  │ 		o = { "step out" },                               │
	--  │ 		r = { "repl" },                                   │
	--  │ 		s = { "scopes" },                                 │
	--  │ 		t = { "terminate" },                              │
	--  │ 		v = { "log variable" },                           │
	--  │ 		v = { "log variable above" },                     │
	--  │ 		w = { "watches" },                                │
	--  │ 	},                                                    │
	--  ╰──────────────────────────────────────────────────────────╯

	g = {
		name = "Git",
		a = { "<cmd>!git add %:p<cr>", "add current" },
		A = { "<cmd>!git add .<CR>", "add all" },
		b = { '<cmd>lua require("internal.blame").open()<CR>', "blame" },
		B = { "<cmd>Telescope git_branches<CR>", "branches" },
		d = {
			name = "Git diff",
			o = { ":DiffviewOpen<CR>", "Git status" },
			c = { ":DiffviewClose<CR>", "Close git diff" },
			f = { ":DiffviewFileHistory %<CR>", "Git status current file" },
			h = { ":DiffviewFileHistory<CR>", "Git status all files history" },
		},
		l = {
			name = "Log",
			a = { '<cmd>lua require("plugins.telescope").my_git_commits()<CR>', "commits (Telescope)" },
			c = { '<cmd>lua require("plugins.telescope").my_git_bcommits()<CR>', "buffer commits (Telescope)" },
		},
		m = { "blame line" },
	},

	s = {
		name = "Search",
		f = { "<cmd>Telescope oldfiles hidden=true<CR>", "file history" },
		c = { '<cmd>lua require("plugins.telescope").command_history()<CR>', "command history" },
		s = { "<cmd>Telescope search_history theme=dropdown<CR>", "search history" },
	},

	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "search files" },
		s = { "<cmd>Telescope live_grep<cr>", "search text" },
		c = { "<cmd>Telescope grep_string<cr>", "search text under cursor" },
		b = { "<cmd>Telescope buffers<cr>", "list open buffers" },
		h = { "<cmd>Telescope find_files hidden=true<cr>", "search hidden files" },
		t = {
			"<cmd>lua vim.cmd('NvimTreeFocus');vim.cmd('Telescope find_files hidden=true')<cr>",
			"search files in tree",
		},
		k = { "<cmd>Telescope keymaps<cr>", "telescope key maps config" },
		["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "search text in current file" },
	},

	k = {
		name = "K9s",
		["9"] = { "<cmd>lua _k9s_toggle()<CR>", "k9s toggle" },
	},

	l = {
		name = "Lazy Git & LSP Saga",
		g = { "<cmd>lua _lazygit_toggle()<CR>", "lazy git toggle" },
		c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "diagnostics under cursor" },
		l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "diagnostics current line" },
	},

	m = {
		name = "Markdown & Harpoon",
		d = { "<cmd>MarkdownPreviewToggle<CR>", "markdown preview toggle" },
		m = { ":Telescope harpoon marks<CR>", "harpoon list marked files" },
		f = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "harpoon quick list marked files" },
		n = { ":lua require('harpoon.ui').nav_next()<CR>", "harpoon open next marked file" },
		p = { ":lua require('harpoon.ui').nav_prev()<CR>", "harpoon open previous marked file" },
	},

	t = {
		name = "Todo & Trouble",
		d = { ":TodoTelescope<CR>", "todo toggle" },
		t = { ":TroubleToggle<CR>", "trouble toggle" },
		w = { ":TroubleToggle workspace_diagnostics<CR>", "trouble diagnostics working project" },
		c = { ":TroubleToggle document_diagnostics<CR>", "trouble diagnostics current file" },
	},

	r = {
		name = "Rename text",
		n = { "lua vim.lsp.buf.rename()<CR>", "rename" },
	},
}

local visual_mode_mappings = {
	-- single
	["s"] = { "<cmd>'<,'>sort<CR>", "sort" },

	a = {
		name = "Actions",
		c = { "comment box" },
	},

	c = {
		name = "LSP",
		a = { "range code action" },
		f = { "range format" },
	},

	g = {
		name = "Git",
		h = {
			name = "Hunk",
			r = "reset hunk",
			s = "stage hunk",
		},
	},

	p = {
		name = "Project",
		r = { "refactor" },
	},

	t = {
		name = "Table Mode",
		t = { "tableize" },
	},
}

wk.register(normal_mode_mappings, opts)
wk.register(visual_mode_mappings, visual_opts)
