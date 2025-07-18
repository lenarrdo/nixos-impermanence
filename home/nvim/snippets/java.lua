return {
  s(
    { trig = "so" },
    fmta(
      [[
        System.out.print(<>);<>
      ]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "main" },
    fmta(
      [[
        public static void main(String[] args) {
            <>
        }
      ]],
      { i(0) }
    )
  ),
}
