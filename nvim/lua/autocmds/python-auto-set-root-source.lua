-- Set PYTHONPATH to <git-root>/src for python buffers.
-- Deferred: the `git rev-parse` shell-out runs lazily on the first python
-- buffer (cached after), instead of synchronously at every startup (~14ms).
local top_level

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        if not top_level then
            local os_extend = require("utils.os_extend")
            top_level = os_extend.capture("git rev-parse --show-toplevel") .. "/src"
        end
        vim.env.PYTHONPATH = top_level
    end,
})
