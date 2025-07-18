local map = vim.keymap.set

-- Better up/down
map({ "n", "x" }, "j", "gj", { noremap = true, silent = true })
map({ "n", "x" }, "k", "gk", { noremap = true, silent = true })
map({ "n", "x" }, "gj", "j", { noremap = true, silent = true })
map({ "n", "x" }, "gk", "k", { noremap = true, silent = true })

-- Reindent
map("v", "<S-j>", ":m '>+1<cr>gv=gv")
map("v", "<S-k>", ":m '<-2<cr>gv=gv")
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })

-- Keep the cursor centered
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })
map("n", "<S-g>", "<S-g>zz", { noremap = true })
map("n", "n", "nzz", { noremap = true })
map("n", "N", "Nzz", { noremap = true })

-- All lowercase and replace spaces with '-'
map("v", "gns", "u<cmd>'<,'>s/ /-/g<cr><cmd>noh<cr>")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Buffers
map("n", "<C-h>", "<cmd>bprevious<cr>")
map("n", "<C-l>", "<cmd>bnext<cr>")
map("n", "<C-q>", "<cmd>bdelete<cr>")

-- CTRL + Backspace in insert mode
map("i", "<C-BS>", "<C-W>", { noremap = true })

-- Join lines without adding the extra space
map("n", "<C-j>", "<S-j>x", { noremap = true })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    map({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
  end,
})
