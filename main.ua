# Experimental!
S ~ "hypertext.ua/server"
  ~ Assets Cfg Files Req
  ~ MakeRoutes! Run‼

MakeRoutes!"pages"

As ← ⍚⊂@/ Files {"assets" "deindent.js" "favicon.ico" "htmx.min.js"}

ρ ← ⍣(
  Assets As
| Routes
)

ε ← ⨬(
  "500 Internal Server Error" map∩□"Content-Type" "text/plain" utf₈
| "404 Not Found" map∩□"Content-Type" "text/plain" utf₈ "Not Found"
)⊸≍"No route declared"

Cfg ⊚4 8443 ⊃(
  Cert: "data/cert.cer"
| Key: "data/key.key"
)

Run‼ρ ε
