return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      c = { "linux_kernel" },
      cpp = { "clang_format" },
      haskell = { "ormolu" },
      html = { "prettier" },
      java = { "google-java-format" },
      javascript = { "prettier" },
      css = { "prettier" },
      json = { "jq" },
      lua = { "stylua" },
      markdown = { "prettier" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      nix = { "nixfmt" },
      typst = { "typstyle" },
      ["*"] = { "trim_whitespace" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },

    format_on_save = { timeout_ms = 500 },

    formatters = {
      linux_kernel = {
        command = "clang-format",
        args = { "--style=file:" .. os.getenv("HOME") .. "/.config/.clang-format" },
      },
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      prettier = {
        prepend_args = { "--print-width", "Infinity" },
      },
    },
  },
}
