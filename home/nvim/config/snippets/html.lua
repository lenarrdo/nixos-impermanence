local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  autosnippet({ trig = ",b" }, fmta("<b>[]</b>[]", { i(1), i(0) }, { delimiters = "[]" })),
  autosnippet({ trig = ",e" }, fmta("<i>[]</i>[]", { i(1), i(0) }, { delimiters = "[]" })),
  autosnippet(
    { trig = ",p" },
    fmta("<p>[]</p>[]", { i(1), i(0) }, { delimiters = "[]" }),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = ".i" },
    fmta("<li>[]</li>[]", { i(1), i(0) }, { delimiters = "[]" }),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = ",o" },
    fmta(
      [[
        <ol>
          <li>[]</li>[]
        </ol>[]
      ]],
      { i(1), i(2), i(0) },
      { delimiters = "[]" }
    ),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = ",u" },
    fmta(
      [[
        <ul>
          <li>[]</li>[]
        </ul>[]
      ]],
      { i(1), i(2), i(0) },
      { delimiters = "[]" }
    ),
    { condition = line_begin }
  ),
}
