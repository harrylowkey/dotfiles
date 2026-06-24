local present, wk = pcall(require, "which-key")
if not present then
	return
end

local function attach_markdown(bufnr)
	wk.register({
		a = {
			name = "Actions",
			m = { "<cmd>MarkdownPreviewToggle<CR>", "markdown preview" },
		},
	}, {
		buffer = bufnr,
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	})
end

local function attach_typescript(bufnr)
	wk.register({
		c = {
			name = "LSP",
			e = { "<cmd>TSC<CR>", "workspace errors (TSC)" },
			F = { "<cmd>TSToolsFixAll<CR>", "fix all" },
			i = { "<cmd>TSToolsAddMissingImports<CR>", "import all" },
			o = { "<cmd>TSToolsOrganizeImports<CR>", "organize imports" },
			s = { "<cmd>TSToolsSortImports<CR>", "sort imports" },
			u = { "<cmd>TSToolsRemoveUnused<CR>", "remove unused" },
		},
	}, {
		buffer = bufnr,
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	})
end

local function attach_zen(bufnr)
	wk.register({
		["z"] = { "<cmd>ZenMode<CR>", "zen" },
	}, {
		buffer = bufnr,
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	})
end

local function attach_spectre(bufnr)
	wk.register({
		["R"] = { "[SPECTRE] Replace all" },
		["o"] = { "[SPECTRE] Show options" },
		["q"] = { "[SPECTRE] Send all to quicklist" },
		["v"] = { "[SPECTRE] Change view mode" },
	}, {
		buffer = bufnr,
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	})
end

local function attach_nvim_tree(bufnr)
	wk.register({
		["="] = { "<cmd>NvimTreeResize +5<CR>", "resize +5" },
		["-"] = { "<cmd>NvimTreeResize -5<CR>", "resize +5" },
	}, {
		buffer = bufnr,
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	})
end

return {
	attach_markdown = attach_markdown,
	attach_typescript = attach_typescript,
	attach_zen = attach_zen,
	attach_spectre = attach_spectre,
	attach_nvim_tree = attach_nvim_tree,
}
