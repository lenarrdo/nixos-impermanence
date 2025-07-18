local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_mathzone = function()
  return vim.fn["typst#in_math"]() == 1
end
local in_text = function()
  return vim.fn["typst#in_markup"]() == 1
end

return {
  -- creazione di ambienti matematici
  autosnippet({ trig = "mk" }, fmta("$<>$<>", { i(1), i(0) }), { condition = in_text }),
  autosnippet(
    { trig = "dm" },
    fmta(
      [[
        $
          <>
        $<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),

  -- sommatorie, integrali, limiti ecc.
  autosnippet(
    { trig = "sum" },
    fmta("sum_(<> = <>)^(<>)<>", { i(1, "i"), i(2, "0"), i(3, "infinity"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "int" },
    fmta("integral_(<>)^(<>)<>", { i(1, "a"), i(2, "b"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "lim" },
    fmta("lim_([] -> []) []", { i(1, "x"), i(2, "0"), i(0, "f(x)") }, { delimiters = "[]" }),
    { condition = in_mathzone }
  ),

  -- simboli
  autosnippet({ trig = "ecc" }, { t("subset.eq") }, { condition = in_mathzone }),
  autosnippet(
    { trig = "__" },
    fmta("underline(<>)<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "oli" },
    fmta("overline(<>)<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet({ trig = "^^" }, fmta("hat(<>)<>", { i(1), i(0) }), { condition = in_mathzone }),
  autosnippet({ trig = "|-" }, { t("tack") }, { condition = in_mathzone }),
  autosnippet({ trig = "|=" }, { t("tack.double") }, { condition = in_mathzone }),

  -- parentesi accoppiate
  autosnippet(
    { trig = "lra" },
    fmta("angle.l <> angle.r<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "[[" },
    fmta("bracket.l.double <> bracket.r.double<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),

  -- font
  autosnippet(
    { trig = "cal" },
    fmta("cal(<>)<>", { i(1, "P"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet({ trig = ",v" }, fmta("#`<>`<>", { i(1), i(0) }), { condition = in_mathzone }),
}
