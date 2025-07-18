local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local d = ls.dynamic_node
local sn = ls.snippet_node
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  autosnippet(",b", fmta("**<>**<>", { i(1), i(0) })),
  autosnippet(",s", fmta("~~<>~~<>", { i(1), i(0) })),
  autosnippet(",e", fmta("_<>_<>", { i(1), i(0) })),
  autosnippet(",v", fmta("`<>`<>", { i(1), i(0) })),
  autosnippet("1#", fmta("# <>", { i(0) })),
  autosnippet("2#", fmta("## <>", { i(0) })),
  autosnippet("3#", fmta("### <>", { i(0) })),
  autosnippet("4#", fmta("#### <>", { i(0) })),
  autosnippet("5#", fmta("##### <>", { i(0) })),
  autosnippet("6#", fmta("###### <>", { i(0) })),
  autosnippet(",l", fmta("[<>](<>)<>", { i(1, "nome"), i(2, "URL"), i(0) })),
  autosnippet(",f", fmta("![<>](<>)<>", { i(1, "nome"), i(2, "path"), i(0) })),
  autosnippet(
    { trig = ",q", condition = line_begin },
    fmt(
      [[
        > {}

        {}
      ]],
      { i(1), i(0) }
    )
  ),
  autosnippet(
    { trig = ",c", condition = line_begin },
    fmta(
      [[
        ```<>
        <>
        ```<>
      ]],
      { i(1, "lang"), i(2), i(0) }
    )
  ),
  autosnippet(
    { trig = ".e", condition = line_begin },
    d(1, function()
      if vim.fn["line"](".") == 1 then
        return sn(nil, fmta("## [" .. os.date("%H:%M") .. ", <>]<>", { i(1), i(0) }))
      else
        return sn(nil, t("## [" .. os.date("%H:%M") .. "]"))
      end
    end)
  ),

  -- math stuff
  autosnippet("mk", fmta("$<>$<>", { i(1), i(0) })),
  autosnippet(
    { trig = ",dm", condition = line_begin },
    fmta(
      [[
        $$
          <>
        $$<>
      ]],
      { i(1), i(0) }
    )
  ),
}
