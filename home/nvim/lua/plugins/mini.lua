return {
  "echasnovski/mini.nvim",
  version = false,
  config = function(_)
    require("mini.icons").setup()
    require("mini.diff").setup()
    require("mini.statusline").setup()
    require("mini.splitjoin").setup()
    require("mini.pick").setup({
      vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>"),
      vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>"),
    })
    require("mini.files").setup({
      vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<cr>"),
    })
    require("mini.starter").setup({
      header = [[
┌──────────────────────────────────────────────────────────┐
│                                                          │
│    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗    │
│    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    │
│    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║    │
│    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║    │
│    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    │
│    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    │
└──────────────────────────────────────────────────────────┘
        ]],
      footer = "",
    })
  end,
}
