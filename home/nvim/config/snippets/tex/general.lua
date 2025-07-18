local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_text = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

return {
  autosnippet({ trig = ",b" }, fmta("\\textbf{<>}<>", { i(1), i(0) }), { condition = in_text }),
  autosnippet({ trig = ".e" }, fmta("\\emph{<>}<>", { i(1), i(0) }), { condition = in_text }),
  autosnippet({ trig = ".i" }, { t("\\item") }, { condition = in_text * line_begin }),
  autosnippet({ trig = '""' }, fmta("``<>''<>", { i(1), i(0) }), { condition = in_text }),
  autosnippet({ trig = ",v" }, fmta("\\verb|<>|<>", { i(1), i(0) }), { condition = in_text }),
  autosnippet({ trig = ",sc" }, fmta("\\textsc{<>}<>", { i(1), i(0) }), { condition = in_text }),
  autosnippet(
    { trig = ",c" },
    fmta(
      [[
        \chapter{<>}
        \thispagestyle{empty}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = ",s" },
    fmta(
      [[
        \section{<>}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = ".s" },
    fmta(
      [[
        \subsection{<>}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "-s" },
    fmta(
      [[
        \subsubsection{<>}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = ",p" },
    fmta(
      [[
        \paragraph{<>}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
}
