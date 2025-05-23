return {
  -- theme
  { "diegoulloao/neofusion.nvim", priority = 1000, config = true, opts = ... },
  { "sainnhe/gruvbox-material",   lazy = true },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "deep",
      })
    end,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("config.plugins.kanagawa_theme")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("config.plugins.catppuccin_theme")
    end,
  },
  ---
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("config.plugins.transparent")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("config.plugins.nvim-web-devicons")
    end,
  },
  { "onsails/lspkind.nvim" },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("config.plugins.nvim-notify")
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("config.plugins.noice")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.lualine")
    end,
  },
  -- animation
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
      opts.cursor = {
        enable = false,
      }
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("config.plugins.indent-blankline")
    end,
  },
  {
    "echasnovski/mini.indentscope",
    version = false,     -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    opts = {},
    config = function()
      require("config.plugins.indent-scope")
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "JetbrainsMono Nerd Font",
        to_clipboard = true,
        theme = "TwoDark",
        background_image = "/Users/harrydang/.config/wallpapers/galaxy.png",
        language = nil,
        window_title = function()
          return vim.fn.expand("%:t")
        end,
      })
    end,
  },
}
