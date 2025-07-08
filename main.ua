# Experimental!
~ "hypertext.ua/server"
  ~ Assets Files
  ~ MakeRoutes! Run‼

MakeRoutes!"pages"

𝓡 ← ⍣(
  Routes
| Assets ⍚⊂@/ Files {"htmx.min.js" "mdl" "assets"}
| ⍤⊙0 $"No route or asset found! _ _"
)

𝓔 ← "500 Internel Server Error" "text/plain" utf₈

Run‼(
  𝓡
| 𝓔
) 0_0_0_0 8000
