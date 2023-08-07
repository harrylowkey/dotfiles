local Terminal = require("toggleterm.terminal").Terminal

local k9s = Terminal:new({
	cmd = "k9s",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "curved", -- single/double/shadow/curved
		width = math.floor(0.75 * vim.fn.winwidth(0)),
		height = math.floor(0.85 * vim.fn.winheight(0)),
		winblend = 4,
	},
	on_open = function(term)
		require("shade").toggle()
	end,
	---@diagnostic disable-next-line: unused-local
	on_close = function(term)
		require("shade").toggle()
	end,
})

function _k9s_toggle()
	k9s:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>k9", "<cmd>lua _k9s_toggle()<CR>", { noremap = true, silent = true })
