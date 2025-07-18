local options = {
  expandtab = true,
  number = true,
  shiftwidth = 2,
  tabstop = 8,
  clipboard = "unnamedplus",
  colorcolumn = "0",
  conceallevel = 2,
  confirm = true,
  ignorecase = true,
  list = true,
  relativenumber = true,
  scrolloff = 8,
  showmode = false,
  sidescrolloff = 8,
  signcolumn = "yes",
  smartcase = true,
  smartindent = true,
  spell = true,
  spelllang = "it,en",
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  timeout = true,
  timeoutlen = 500,
  undofile = true,
  undolevels = 10000,
  updatetime = 200,
  wrap = false,
  guicursor = "",
  cursorline = true,
}

local global = {
  mapleader = " ",
  maplocalleader = "\\",
  c_syntax_for_h = 1,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end

for name, value in pairs(global) do
  vim.g[name] = value
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
