local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.html",
  callback = function()
    vim.keymap.set({ "i", "n" }, "<C-T>", function()
      if vim.bo.filetype == "html" then
        vim.bo.filetype = "tex"
      else
        vim.bo.filetype = "html"
      end
    end, { desc = "Toggle filetype between html and tex" })

    vim.opt_local.wrap = true
    vim.keymap.set("v", ",b", "c<b></b>" .. esc .. "hhhP")
    vim.keymap.set("v", ",e", "c<i></i>" .. esc .. "hhhP")
    vim.keymap.set("v", ",u", "c<u></u>" .. esc .. "hhhP")
    vim.keymap.set("n", "<leader>rj", "<cmd>:wa | :TypstPreview<cr>")
  end,
})
