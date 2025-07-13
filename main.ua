# Experimental!
~ "hypertext.ua/server"
  ~ Assets Cfg Files
  ~ MakeRoutes! Run‼

MakeRoutes!"pages"

As ← ⍚⊂@/ Files {"htmx.min.js" "assets"}

𝓡 ← ⍣(
  Routes
| Assets As
| ⍤⊙0 ⋅$"No route/asset declared: _"
)

𝓔 ← ⨬(
  "500 Internal Server Error" "text/plain" utf₈
| "404 Not Found" "text/plain" utf₈ "Not Found"
)⊢⊸⌕"No route/asset declared:"

Cfg ⊚4 8e3 ⊃(
  Cert: &fras "data/cert.pem"
| Key: &fras "data/key.pem"
)

Run‼(𝓡|𝓔)
