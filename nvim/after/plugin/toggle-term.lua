require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.3
		elseif term.direction == "vertical" then
			return 60
		end
	end,
	open_mapping = [[<F12>]],
	---@diagnostic disable-next-line: unused-local
	on_open = function(term)
		require("shade").toggle()
	end,
	---@diagnostic disable-next-line: unused-local
	on_close = function(term)
		require("shade").toggle()
	end,
	highlights = {
		Normal = { link = "Normal" },
		NormalFloat = { link = "Normal" },
		FloatBorder = { link = "FloatBorder" },
	},
	direction = "horizontal", -- | 'horizontal' | 'window' | 'float',
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	close_on_exit = true, -- close the terminal window when the process exits
})
