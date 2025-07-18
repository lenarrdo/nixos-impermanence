local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.typ",
  callback = function()
    vim.keymap.set("v", ",b", "c**" .. esc .. "P")
    vim.keymap.set("v", ",e", "c__" .. esc .. "P")
    vim.keymap.set("n", "<leader>rj", "<cmd>:wa | :TypstPreview<cr>")

    vim.opt_local.wrap = true
  end,
})
