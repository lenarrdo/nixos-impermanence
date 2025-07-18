return {
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = true,
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    build = function()
      require("typst-preview").update()
    end,
    config = function(_)
      require("typst-preview").setup({
        debug = false,
        open_cmd = "qutebrowser %s",
        invert_colors = "never",
        follow_cursor = true,
      })
    end,
  },
  {
    "lervag/vimtex",
    ft = "tex",
    init = function(_)
      vim.g.vimtex_view_method = "sioyek"
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      default = {
        dir_path = "figures",
      },
    },
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
