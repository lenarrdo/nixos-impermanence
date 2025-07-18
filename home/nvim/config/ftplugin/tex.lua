local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.keymap.set("v", ",b", "c\\textbf{}" .. esc .. "P")
    vim.keymap.set("v", ",e", "c\\emph{}" .. esc .. "P")
    vim.keymap.set("n", "<leader>rj", "<cmd>:wa | :VimtexCompile<cr>")

    vim.opt_local.wrap = true
  end,
})
