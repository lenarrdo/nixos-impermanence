vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.rs",
  callback = function()
    vim.keymap.set(
      "n",
      "<leader>rj",
      "<cmd>:wa | :vsp | term rustc -o a.out % && ./a.out && rm *.out<cr>"
    )
  end,
})
