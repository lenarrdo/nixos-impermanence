vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.java",
  callback = function()
    vim.keymap.set("n", "<leader>rj", "<cmd>:wa | :vsp | term java %<cr>")

    vim.opt_local.colorcolumn = "100"
  end,
})
