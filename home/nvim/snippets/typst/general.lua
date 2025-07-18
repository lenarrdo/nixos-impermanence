local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  autosnippet({ trig = ",b" }, fmta("*<>*<>", { i(1), i(0) })),
  autosnippet({ trig = ",e" }, fmta("_<>_<>", { i(1), i(0) })),
  autosnippet({ trig = ",v" }, fmta("`<>`<>", { i(1), i(0) })),
  autosnippet({ trig = ",ic" }, fmta("```<> <>```<>", { i(1, "lang"), i(2), i(0) })),
  autosnippet({ trig = ",u" }, fmta("#underline[<>]<>", { i(1), i(0) })),
  autosnippet({ trig = ",sc" }, fmta("#smallcaps[<>]<>", { i(1), i(0) })),
  autosnippet({ trig = ",st" }, fmta("#strike[<>]<>", { i(1), i(0) })),
  autosnippet({ trig = ",h" }, fmta("#highlight[<>]<>", { i(1), i(0) })),
  autosnippet(
    { trig = "fig" },
    fmta(
      [[
        #figure(
          image("[]", width: []%),
        ) <[]>[]
      ]],
      { i(1), i(2, "80"), i(3), i(0) },
      { delimiters = "[]" }
    ),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = "dfig" },
    fmta(
      [[
        #figure(
          image("{}", width: {}%),
          caption: [{}],
        ) <{}>{}
      ]],
      { i(1), i(2, "80"), i(3), i(4), i(0) },
      { delimiters = "{}" }
    ),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = "cent" },
    fmta(
      [[
        #align(center)[
          <>
        ]<>
      ]],
      { i(1), i(0) }
    ),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = "tab" },
    fmta(
      [[
        #table(
          columns: (<>),
          <>
        )<>
      ]],
      { i(1), i(2), i(0) }
    ),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = ",c" },
    fmta(
      [[
        ```<>
        <>
        ```
      ]],
      { i(1, "lang"), i(0) }
    ),
    { condition = line_begin }
  ),
  autosnippet(
    { trig = "cop" },
    fmta(
      [[
        #show: copertina.with(
          nome-corso: [<>],
          codice-corso: [<>],
          titolo: [<>],
          anno-accademico: [<>],
        )<>
      ]],
      { i(1, "nome"), i(2, "codice"), i(3, "titolo"), i(4, "xxxx/xxxx"), i(0) }
    ),
    { condition = line_begin }
  ),
}
