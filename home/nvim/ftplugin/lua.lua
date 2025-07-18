vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.lua",
  callback = function()
    vim.opt_local.colorcolumn = "100"
  end,
})
