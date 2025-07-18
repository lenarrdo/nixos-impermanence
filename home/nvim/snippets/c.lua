local luasnip = require("luasnip")
local c = luasnip.choice_node

return {
  s(
    { trig = "main" },
    fmta(
      [[
        int main(<>)
        {
        	<>

        	return 0;
        }
      ]],
      {
        c(1, {
          i(nil, "void"),
          i(nil, "int argc, char *argv[]"),
        }),
        i(0),
      }
    )
  ),
  s(
    { trig = "iguard" },
    fmta(
      [[
        #ifndef <>
        #define <>

        <>

        #endif // <>
      ]],
      { i(1), rep(1), i(0), rep(1) }
    )
  ),
}
