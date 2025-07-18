vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.c",
  callback = function()
    vim.keymap.set("n", "<leader>rj", "<cmd>:wa | :vsp | term gcc % && ./a.out && rm *.out<cr>")
    vim.keymap.set("n", "<F5>", "<cmd>:wa | :vsp | term make<cr>")

    vim.opt_local.colorcolumn = "80"
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
  end,
})
