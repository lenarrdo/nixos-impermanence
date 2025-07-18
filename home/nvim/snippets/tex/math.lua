local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local in_text = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

return {
  -- inline/display math mode
  autosnippet({ trig = "mk" }, fmta("\\(<>\\)<>", { i(1), i(0) }), { condition = in_text }),
  autosnippet(
    { trig = "dm" },
    fmta(
      [[
        \[
          <>
        \]<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),

  -- frazioni, pedici, apici
  autosnippet(
    { trig = "ff" },
    fmta("\\frac{<>}{<>}<>", { i(1, "num"), i(2, "den"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "([%w+%)%]%}])_", regTrig = true, wordTrig = false },
    fmta("<>_{<>}<>", { f(function(_, snip)
      return snip.captures[1]
    end), i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "([%w+%)%]%}])^", regTrig = true, wordTrig = false },
    fmta("<>^{<>}<>", { f(function(_, snip)
      return snip.captures[1]
    end), i(1), i(0) }),
    { condition = in_mathzone }
  ),

  -- parentesi e moduli
  autosnippet(
    { trig = "lrm" },
    fmta("\\left\\lvert <> \\right\\rvert<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "lrt" },
    fmta("\\left( <> \\right)<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "lrq" },
    fmta("\\left[ <> \\right]<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "lrg" },
    fmta("\\left\\{ <> \\right\\}<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "lra" },
    fmta("\\left\\langle <> \\right\\rangle<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "[[" },
    fmta("\\textlbrackdbl <> \\textrbrackdbl<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),

  -- funzioni goniometriche
  autosnippet({ trig = "sin" }, { t("\\sin") }, { condition = in_mathzone }),
  autosnippet({ trig = "Sin" }, { t("\\arcsin") }, { condition = in_mathzone }),
  autosnippet({ trig = "cos" }, { t("\\cos") }, { condition = in_mathzone }),
  autosnippet({ trig = "Cos" }, { t("\\arccos") }, { condition = in_mathzone }),
  autosnippet({ trig = "tan" }, { t("\\tan") }, { condition = in_mathzone }),
  autosnippet({ trig = "Tan" }, { t("\\arctan") }, { condition = in_mathzone }),

  -- operatori binari
  autosnippet({ trig = "ge" }, { t("\\ge") }, { condition = in_mathzone }),
  autosnippet({ trig = "le" }, { t("\\le") }, { condition = in_mathzone }),
  autosnippet({ trig = "neq" }, { t("\\neq") }, { condition = in_mathzone }),
  autosnippet({ trig = "neg" }, { t("\\neg") }, { condition = in_mathzone }),
  autosnippet({ trig = "CE" }, { t("\\Coloneqq") }, { condition = in_mathzone }),
  autosnippet({ trig = "ce" }, { t("\\coloneqq") }, { condition = in_mathzone }),
  autosnippet({ trig = "equiv" }, { t("\\equiv") }, { condition = in_mathzone }),
  autosnippet({ trig = "sim" }, { t("\\sim") }, { condition = in_mathzone }),
  autosnippet({ trig = "esim" }, { t("\\simeq") }, { condition = in_mathzone }),
  autosnippet({ trig = "app" }, { t("\\approx") }, { condition = in_mathzone }),
  autosnippet({ trig = "cc" }, { t("\\subset") }, { condition = in_mathzone }),
  autosnippet({ trig = "ecc" }, { t("\\subseteq") }, { condition = in_mathzone }),
  autosnippet({ trig = "ECC" }, { t("\\sqsubseteq") }, { condition = in_mathzone }),
  autosnippet({ trig = "inn" }, { t("\\in") }, { condition = in_mathzone }),
  autosnippet({ trig = "nin" }, { t("\\notin") }, { condition = in_mathzone }),
  autosnippet({ trig = "nni" }, { t("\\ni") }, { condition = in_mathzone }),
  autosnippet({ trig = "nn" }, { t("\\cap") }, { condition = in_mathzone }),
  autosnippet({ trig = "uu" }, { t("\\cup") }, { condition = in_mathzone }),
  autosnippet({ trig = "or" }, { t("\\vee") }, { condition = in_mathzone }),
  autosnippet({ trig = "and" }, { t("\\wedge") }, { condition = in_mathzone }),
  autosnippet({ trig = "oo" }, { t("\\circ") }, { condition = in_mathzone }),
  autosnippet({ trig = "**" }, { t("\\cdot") }, { condition = in_mathzone }),
  autosnippet({ trig = "xx" }, { t("\\times") }, { condition = in_mathzone }),
  autosnippet({ trig = "||" }, { t("\\mid") }, { condition = in_mathzone }),
  autosnippet({ trig = "tc" }, { t("\\tc") }, { condition = in_mathzone }),
  autosnippet({ trig = "vd" }, { t("\\vdash") }, { condition = in_mathzone }),
  autosnippet({ trig = "VD" }, { t("\\vDash") }, { condition = in_mathzone }),

  -- frecce
  autosnippet({ trig = "ts" }, { t("\\gets") }, { condition = in_mathzone }),
  autosnippet({ trig = "to" }, { t("\\to") }, { condition = in_mathzone }),
  autosnippet({ trig = "To" }, { t("\\Rightarrow") }, { condition = in_mathzone }),
  autosnippet({ trig = "arrows" }, { t("\\rightrightarrows") }, { condition = in_mathzone }),
  autosnippet({ trig = "imp" }, { t("\\implies") }, { condition = in_mathzone }),
  autosnippet({ trig = "impby" }, { t("\\impliedby") }, { condition = in_mathzone }),
  autosnippet({ trig = "iff" }, { t("\\iff") }, { condition = in_mathzone }),
  autosnippet({ trig = "vec" }, fmta("\\vec{<>}<>", { i(1), i(0) }), { condition = in_mathzone }),

  -- limiti, integrali, logaritmi...
  autosnippet(
    { trig = "lim" },
    fmta("\\lim_{<>\\to <>}<>", { i(1, "n"), i(2, "+\\infty"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "int" },
    fmta("\\int_{<>}^{<>}<>", { i(1, "a"), i(2, "b"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet({ trig = "indint" }, { t("\\int") }, { condition = in_mathzone }),
  autosnippet({ trig = "oint" }, { t("\\oint") }, { condition = in_mathzone }),
  autosnippet({ trig = "df" }, { t("\\diff") }, { condition = in_mathzone }),
  autosnippet(
    { trig = "sum" },
    fmta("\\sum_{<>=<>}^{<>}<>", { i(1, "i"), i(2, "0"), i(3, "+\\infty"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "log" },
    fmta("\\log_{<>}(<>)<>", { i(1), i(2), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet({ trig = "ln" }, fmta("\\ln(<>)<>", { i(1), i(0) }), { condition = in_mathzone }),

  -- simboli
  autosnippet({ trig = "inf" }, { t("\\infty") }, { condition = in_mathzone }),
  autosnippet({ trig = "pm" }, { t("\\pm") }, { condition = in_mathzone }),
  autosnippet({ trig = "mp" }, { t("\\mp") }, { condition = in_mathzone }),
  autosnippet({ trig = "AA" }, { t("\\forall") }, { condition = in_mathzone }),
  autosnippet({ trig = "EE" }, { t("\\exists") }, { condition = in_mathzone }),
  autosnippet({ trig = "NEE" }, { t("\\nexists") }, { condition = in_mathzone }),
  autosnippet({ trig = "ll" }, { t("\\ell") }, { condition = in_mathzone }),
  autosnippet({ trig = "OO" }, { t("\\emptyset") }, { condition = in_mathzone }),
  autosnippet({ trig = "..." }, { t("\\dots") }, { condition = in_mathzone }),

  -- "environments"
  autosnippet({ trig = '"' }, fmta("\\text{<>}<>", { i(1), i(0) }), { condition = in_mathzone }),
  autosnippet(
    { trig = "ubra" },
    fmta("\\underbrace{<>}_{<>}<>", { i(1, "contenuto"), i(2, "sotto"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "obra" },
    fmta("\\overbrace{<>}_{<>}<>", { i(1, "contenuto"), i(2, "sopra"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "oli" },
    fmta("\\overline{<>}<>", { i(1, "x"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "uset" },
    fmta("\\underset{<>}{<>}<>", { i(1, "sotto"), i(2, "sopra"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "sq" },
    fmta("\\sqrt{<>}<>", { i(1, "x"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "rt" },
    fmta("\\sqrt[<>]{<>}<>", { i(1, "indice"), i(2, "argomento"), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "^^" },
    fmta("\\widehat{<>}<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "cases" },
    fmta(
      [[
        \begin{cases}
          <> & \text{se } <> \\
          <>
        \end{cases}
      ]],
      { i(1), i(2), i(0) }
    ),
    { condition = in_mathzone * line_begin }
  ),
  autosnippet(
    { trig = "mat" },
    fmta(
      [[
        \begin{pmatrix}
          <>
        \end{pmatrix}
      ]],
      { i(0) }
    ),
    { condition = in_mathzone * line_begin }
  ),
  autosnippet(
    { trig = "equ" },
    fmta(
      [[
        \begin{equation}
          <>
        \end{equation}
      ]],
      { i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "eqsp" },
    fmta(
      [[
        \begin{equation*}
          \begin{split}
            <>
          \end{split}
        \end{equation*}
      ]],
      { i(0) }
    ),
    { condition = in_text * line_begin }
  ),

  -- fonts
  autosnippet(
    { trig = "BB(%w+)", regTrig = true, hidden = true },
    fmta("\\mathbb{<>}<>", { f(function(_, snip)
      return snip.captures[1]
    end), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet(
    { trig = "CAL(%w+)", regTrig = true, hidden = true },
    fmta("\\mathcal{<>}<>", { f(function(_, snip)
      return snip.captures[1]
    end), i(0) }),
    { condition = in_mathzone }
  ),
  autosnippet({ trig = "tt" }, fmta("\\mathtt{<>}<>", { i(1), i(0) }), { condition = in_mathzone }),

  -- spazi vuoti
  autosnippet({ trig = "qq" }, { t("\\quad") }, { condition = in_mathzone }),
  autosnippet({ trig = "QQ" }, { t("\\qquad") }, { condition = in_mathzone }),

  -- decorazioni (i guess)
  autosnippet(
    { trig = "__" },
    fmta("\\underline{<>}<>", { i(1), i(0) }),
    { condition = in_mathzone }
  ),
}
