local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.keymap.set("v", ",b", "c****" .. esc .. "hP")
    vim.keymap.set("v", ",e", "c**" .. esc .. "P")
    vim.keymap.set("i", "<C-d>", "<cmd>:pu=strftime('%H:%M')<cr>Jx")

    vim.opt_local.wrap = true
  end,
})
