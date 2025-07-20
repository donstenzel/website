# Experimental!
S ~ "hypertext.ua/server"
  ~ Assets Cfg Files
  ~ MakeRoutes! Run‼

MakeRoutes!"pages"

As ← ⍚⊂@/ Files {"htmx.min.js" "assets" "favicon.ico" "deindent.js"}

ρ ← ⍣(
  Assets As ⊙⊙⋅◌
| Routes
)

ε ← ⨬(
  "500 Internal Server Error" "text/plain" utf₈
| "404 Not Found" "text/plain" utf₈ "Not Found"
)⊸≍"No route declared"

Cfg ⊚4 8443 ⊃(
  Cert: "data/cert.cer"
| Key: "data/key.key"
)

Run‼ρ ε
