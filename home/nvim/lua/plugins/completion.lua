return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function(_)
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          local entry = cmp.get_selected_entry()
          if luasnip.expand_or_jumpable() and not entry then
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            if entry then
              cmp.confirm()
            else
              cmp.select_next_item()
              cmp.confirm()
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function()
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      }),
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  end,
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    config = function(_)
      require("luasnip").config.setup({
        enable_autosnippets = true,
        require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" }),
      })

      -- Forget current snippet when entering normal mode
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*",
        callback = function()
          if
            (
              (vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n")
              or vim.v.event.old_mode == "i"
            )
            and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
          then
            while require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()] ~= nil do
              require("luasnip").unlink_current()
            end
          end
        end,
      })
    end,
  },
}
