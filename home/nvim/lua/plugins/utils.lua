return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "MunifTanjim/nui.nvim" },
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
