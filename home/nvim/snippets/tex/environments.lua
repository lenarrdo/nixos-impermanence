local ls = require("luasnip")
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local in_text = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

return {
  autosnippet(
    { trig = "env" },
    fmta(
      [[
        \begin{<>}
          <>
        \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "fig" },
    fmta(
      [[
        \begin{figure}[H]
          \centering
          \includegraphics[width=0.5\textwidth]{<>}
        \end{figure}
        \noindent <>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "dfig" },
    fmta(
      [[
        \begin{figure}[H]
          \centering
          \includegraphics[width=0.5\textwidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
        \noindent <>
      ]],
      { i(1), i(2), rep(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "cent" },
    fmta(
      [[
        \begin{center}
          <>
        \end{center}
      ]],
      { i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = ",e" },
    fmta(
      [[
        \begin{enumerate}
          \item <>
        \end{enumerate}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = ",i" },
    fmta(
      [[
      \begin{itemize}
        \item <>
      \end{itemize}<>
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "mini" },
    fmta(
      [[
        \begin{minipage}{<>\textwidth}
          <>
        \end{minipage}
      ]],
      { i(1, "0.5"), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "code" },
    fmta(
      [[
        \begin{center}
          \begin{minipage}{0.5\textwidth}
            \begin{lstlisting}[style=<>]

            <>
            \end{lstlisting}
          \end{minipage}
        \end{center}
      ]],
      { i(1, "CSTyle"), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "alg" },
    fmta(
      [[
        \begin{center}
          \colorbox[rgb]{0.95,0.95,0.92} {
          \begin{minipage}{0.7\textwidth}
            \begin{algorithmic}[1]
            <>
            \end{algorithmic}
          \end{minipage}}
        \end{center}
      ]],
      { i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "tab" },
    fmta(
      [[
        \begin{tabular}{ <> }
          <>
        \end{tabular}
      ]],
      { i(1), i(0) }
    ),
    { condition = in_text * line_begin }
  ),
  autosnippet(
    { trig = "def" },
    fmta(
      [[
        \begin{definition}
          <>
        \end{definition}
      ]],
      { i(0) }
    ),
    { condition = in_text * line_begin }
  ),
}
