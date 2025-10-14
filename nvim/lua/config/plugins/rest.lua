local present, rest = pcall(require, "rest-nvim")

if not present then
    return
end

rest.setup({
    client = "curl",
    env_file = ".env",
    env_pattern = "\\.env\\.*",
    env_edit_command = "tabedit",
    encode_url = true,
    skip_ssl_verification = false,
    custom_dynamic_variables = {},
    highlight = {
        enable = true,
        timeout = 750,
    },
    logs = {
        level = "info",
        save = true,
    },
    -- result = {
    --     split = {
    --         horizontal = true,
    --         in_place = false,
    --         stay_in_current_window_after_split = true,
    --     },
    --     behavior = {
    --         decode_url = true,
    --         show_info = {
    --             url = true,
    --             headers = true,
    --             http_info = true,
    --             curl_command = true,
    --         },
    --         statistics = {
    --             enable = true,
    --             ---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
    --             stats = {
    --                 { "total_time", title = "Time taken:" },
    --                 { "size_download_t", title = "Download size:" },
    --             },
    --         },
    --         formatters = {
    --             json = "jq",
    --             html = function(body)
    --                 if vim.fn.executable("tidy") == 0 then
    --                     return body, { found = false, name = "tidy" }
    --                 end
    --                 local fmt_body = vim.fn
    --                     .system({
    --                         "tidy",
    --                         "-i",
    --                         "-q",
    --                         "--tidy-mark",
    --                         "no",
    --                         "--show-body-only",
    --                         "auto",
    --                         "--show-errors",
    --                         "0",
    --                         "--show-warnings",
    --                         "0",
    --                         "-",
    --                     }, body)
    --                     :gsub("\n$", "")
    --
    --                 return fmt_body, { found = true, name = "tidy" }
    --             end,
    --         },
    --     },
    -- },
})
