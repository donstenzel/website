# Experimental!
S ~ "hypertext.ua/server"
  ~ Assets Cfg Files
  ~ MakeRoutes! Run‼

MakeRoutes!"pages"

As ← ⍚⊂@/ Files {"htmx.min.js" "assets" "favicon.ico"}

ρ ← ⍣(
  Assets As ⊙⊙⋅◌
| Routes
)

ε ← ⨬(
  "500 Internal Server Error" "text/plain" utf₈
| "404 Not Found" "text/plain" utf₈ "Not Found"
)⊸≍"No route declared"

Cfg ⊚4 8e3 ⊃(
  Cert: "data/cert.pem"
| Key: "data/key.pem"
)

Run‼ρ ε
