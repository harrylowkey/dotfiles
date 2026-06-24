-- Lazygit floating terminal. The toggleterm require is deferred into the
-- toggle fn so toggleterm stays lazy (first <leader>lg loads it), instead of
-- force-loading toggleterm at startup.
local lazygit

function _lazygit_toggle()
	if not lazygit then
		local Terminal = require("toggleterm.terminal").Terminal
		lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "curved", -- single/double/shadow/curved
				width = math.floor(0.75 * vim.fn.winwidth(0)),
				height = math.floor(0.85 * vim.fn.winheight(0)),
				winblend = 4,
			},
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
		})
	end
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
