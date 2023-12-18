require("colorizer").setup({
  filetypes = {
    "html",
    "css",
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "lua",
  },
  user_default_options = {
    mode = "foreground",
    tailwind = false, -- Enable tailwind colors
  },
})

-- :ColorizerAttachToBuffer
-- :ColorizerDetachFromBuffer
-- :ColorizerReloadAllBuffers
-- :ColorizerToggle
