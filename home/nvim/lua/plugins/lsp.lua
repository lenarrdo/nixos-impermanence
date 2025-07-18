return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  opts = {
    servers = {
      bashls = {},
      clangd = {},
      rust_analyzer = {},
      ts_ls = {},
      tinymist = {
        root_dir = vim.fn.getcwd(),
      },
      hls = {
        handlers = {
          ["$/progress"] = function(_, _, _) end,
        },
      },
      jdtls = {
        root_dir = vim.fn.getcwd(),
        handlers = {
          ["$/progress"] = function(_, _, _) end,
          ["language/status"] = function(_, _)
            print("ServiceReady")
          end,
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "i", "f", "t", "rep", "s", "fmta", "fmt" },
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      -- config.capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig[server].setup(config)
    end
  end,
}
