local nvimtree = require("nvim-tree")
local os_extend = require("utils.os_extend")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local function custom_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "cr", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "cd", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("help"))
end

nvimtree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = { ".git", "node_modules", ".cache" },
	},
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = " ", -- arrow when folder is closed
					arrow_open = " ", -- arrow when folder is open
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	on_attach = custom_on_attach,
})

-- open nvim-tree on setup

local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local top_level = os_extend.capture("git rev-parse --show-toplevel")
vim.keymap.set(
	"n",
	",cr",
	":lua require('nvim-tree.api').tree.change_root('" .. top_level .. "')<CR>",
	{ silent = true, noremap = true }
)
vim.keymap.set(
	"n",
	",cd",
	":lua require('nvim-tree.api').tree.change_root(vim.fn.expand('%:p:h'))<CR>",
	{ silent = true, noremap = true }
)
