local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  autosnippet({ trig = ",al" }, { t("\\alpha") }, { condition = in_mathzone }),
  autosnippet({ trig = ",be" }, { t("\\beta") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ga" }, { t("\\gamma") }, { condition = in_mathzone }),
  autosnippet({ trig = ";GA" }, { t("\\Gamma") }, { condition = in_mathzone }),
  autosnippet({ trig = ",de" }, { t("\\delta") }, { condition = in_mathzone }),
  autosnippet({ trig = ";De" }, { t("\\Delta") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ep" }, { t("\\varepsilon") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ze" }, { t("\\zeta") }, { condition = in_mathzone }),
  autosnippet({ trig = ",et" }, { t("\\eta") }, { condition = in_mathzone }),
  autosnippet({ trig = ",th" }, { t("\\theta") }, { condition = in_mathzone }),
  autosnippet({ trig = ";TH" }, { t("\\Theta") }, { condition = in_mathzone }),
  autosnippet({ trig = ",io" }, { t("\\iota") }, { condition = in_mathzone }),
  autosnippet({ trig = ",la" }, { t("\\lambda") }, { condition = in_mathzone }),
  autosnippet({ trig = ",mu" }, { t("\\mu") }, { condition = in_mathzone }),
  autosnippet({ trig = ",xi" }, { t("\\xi") }, { condition = in_mathzone }),
  autosnippet({ trig = ",oo" }, { t("\\omi") }, { condition = in_mathzone }),
  autosnippet({ trig = ";OO" }, { t("\\Omicron") }, { condition = in_mathzone }),
  autosnippet({ trig = ",pi" }, { t("\\pi") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ro" }, { t("\\rho") }, { condition = in_mathzone }),
  autosnippet({ trig = ",si" }, { t("\\sigma") }, { condition = in_mathzone }),
  autosnippet({ trig = ";SI" }, { t("\\Sigma") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ta" }, { t("\\tau") }, { condition = in_mathzone }),
  autosnippet({ trig = ",up" }, { t("\\upsilon") }, { condition = in_mathzone }),
  autosnippet({ trig = ";Up" }, { t("\\Upsilon") }, { condition = in_mathzone }),
  autosnippet({ trig = ",vp" }, { t("\\varphi") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ph" }, { t("\\phi") }, { condition = in_mathzone }),
  autosnippet({ trig = ";PH" }, { t("\\Phi") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ch" }, { t("\\chi") }, { condition = in_mathzone }),
  autosnippet({ trig = ",ps" }, { t("\\psi") }, { condition = in_mathzone }),
  autosnippet({ trig = ";PS" }, { t("\\Psi") }, { condition = in_mathzone }),
  autosnippet({ trig = ",om" }, { t("\\omega") }, { condition = in_mathzone }),
  autosnippet({ trig = ";OM" }, { t("\\Omega") }, { condition = in_mathzone }),
}
