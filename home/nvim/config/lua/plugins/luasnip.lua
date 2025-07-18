return {
  "L3MON4D3/LuaSnip",
  event = { "BufReadPre", "BufNewFile" },
  config = function(_)
    local luasnip = require("luasnip")

    luasnip.config.setup({
      enable_autosnippets = true,
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" }),
    })

    vim.keymap.set("n", "<Tab>", "<cmd>require('luasnip').expand_or_jump()<cr>", { noremap = true })

    -- Forget current snippet when entering normal mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*",
      callback = function()
        if
          (
            (vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n")
            or vim.v.event.old_mode == "i"
          )
          and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
          and not luasnip.session.jump_active
        then
          while luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] ~= nil do
            luasnip.unlink_current()
          end
        end
      end,
    })
  end,
}
