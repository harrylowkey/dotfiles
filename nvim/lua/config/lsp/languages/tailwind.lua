-- Only attach the tailwindcss language server when the project actually has a
-- tailwind config. By default it auto-attaches to any JS/TS project, where it
-- answers Shift+K hover with an empty result -> a duplicate "No information
-- available" toast next to the real tsserver hover (and wastes a server).
vim.lsp.config("tailwindcss", {
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local found = vim.fs.find({
            "tailwind.config.js",
            "tailwind.config.cjs",
            "tailwind.config.mjs",
            "tailwind.config.ts",
            "tailwind.config.cts",
            "tailwind.config.mts",
        }, { upward = true, path = vim.fs.dirname(fname) })
        if #found > 0 then
            on_dir(vim.fs.dirname(found[1]))
        end
        -- No tailwind config found -> don't call on_dir -> server doesn't attach.
    end,
})
