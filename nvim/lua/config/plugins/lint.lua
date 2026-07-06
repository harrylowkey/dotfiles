local present, lint = pcall(require, "lint")
if not present then
    return
end

lint.linters_by_ft = {
    -- JS/TS eslint is handled by the ESLint LSP (see config.lsp.languages.eslint),
    -- which also gives code actions / EslintFixAll. Don't also run eslint_d here
    -- or every diagnostic (e.g. prettier/prettier) shows up twice.
    python = { "ruff" },
    sh = { "shellcheck" },
    bash = { "shellcheck" },
    zsh = { "shellcheck" },
    yaml = { "yamllint" },
    markdown = { "markdownlint" },
    dockerfile = { "hadolint" },
}

local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})

