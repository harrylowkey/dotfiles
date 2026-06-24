-- k9s floating terminal. toggleterm require deferred into the toggle fn so
-- toggleterm stays lazy (first <leader>k9 loads it).
local k9s

function _k9s_toggle()
	if not k9s then
		local Terminal = require("toggleterm.terminal").Terminal
		k9s = Terminal:new({
			cmd = "k9s",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "curved", -- single/double/shadow/curved
				width = math.floor(0.75 * vim.fn.winwidth(0)),
				height = math.floor(0.85 * vim.fn.winheight(0)),
				winblend = 4,
			},
		})
	end
	k9s:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>k9", "<cmd>lua _k9s_toggle()<CR>", { noremap = true, silent = true })
