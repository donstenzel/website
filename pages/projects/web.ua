~ "../../hypertext.ua/html.ua"
  ~ Code Div H₁ H₄ Img LI P UL
~ "../base" ~ Layout UiuaCode

Space ← ⬚∘Div {"class" "space space--lg"} {}

# code type content ? request
# Route! GET /projects/web
It ← Layout {}⋅{
  H₁ $ Website Utilities

  ⬚∘Div {"class" "u-flex u-flex-wrap "} {
    P $ I've been making some tools to run a website. In fact, this website runs
      $ using these utilities. Of course a proper web framework offers many
      $ more features and is overall much more complete, but I really liked the
      $ idea of web sites in Uiua. Working with Uiua is lovely when it comes to
      $ data so I wouldn't want to miss it when creating websites. I plan on
      $ using this for small interfaces for home automation and small sites like
      $ this one. As of right now there are three parts to the library.
  
    Div {
      H₄ Code $ server.ua
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {
          P {
            $ The first important bit is the
            Code "Cfg"
            $ struct. It represents the server configuration. As of right now,
            $ it contains the address and port to listen on, and an optional
            $ certificate and private key. If these are supplied, they must match up.
            $ Certificate and key should be given as file paths, and their existence
            $ is validated.
          }
        }
        ⬚∘Div {"class" "xl:col"} {
          UiuaCode $ ~Cfg {
                   $   Address: V~Address
                   $   Port: V~Port
                   $   Cert: V~File ← ∞
                   $   Key: V~File ← ∞
                   $ } ∘
        }
      }
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {
          P $ This macro establishes a TCP or TLS listener, depending on key and
            $ certificate being supplied. It will then continously accept connections
            $ and respond to requests on these. If a connection does not send a request
            $ in 30 seconds, the connection is automatically closed. The functions
            $ are router and error handler, respectively.
        }
        ⬚∘Div {"class" "xl:col"} {
          UiuaCode $ Run‼ ← (
                   $   ⨬&tcpl&tlsl Cfg!⊃(
                   $     ×∩(¬≍∞)⊃Cert Key
                   $   | $"_:_" /$"_._"⊃Address Port
                   $   | ∩(⍥&fras¬⊸≍∞) ⊃Cert Key
                   $   )
                   $ 
                   $   ⍢⍣⟜Connect‼^0^1⊙E~Connection 1
                   $ )
        }
      }
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {
          P $ This macro establishes a single connection and continously responds
            $ to requests. This happens synchronously. After 30 seconds without any
            $ request, the connection is automatically closed.
        }
        ⬚∘Div {"class" "xl:col"} {
          UiuaCode $ Connect‼ ← (
                   $   ◌ pool⍣⍢Respond‼^0^1 1 ⊃&cl(
                   $     ⊓&tcpaddrTime
                   $     &p$"[_ @ _] Closing connection."
                   $   )⊸&tcpsrt 30 &tcpa
                   $ )
        }
      }
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {
          P {
            $ This macro responds to a single request. The routing of requests
            $ is delegated to the functions that are given. The first function
            $ should be the normal router, and the second one an error handler.
            $ Both must return a valid response in the form of response code,
            $ headers and content. The router gets a request struct from
            Code "http.ua"
            $ . The response is then formatted and sent to the socket.
          }
        }
        ⬚∘Div {"class" "xl:col"} {
          UiuaCode $ Respond‼ ← (
                   $   ⊃&tcpaddr⊸Receive
                   $   &p$"[_ @ _] _ _"⊙⊓Time⊸Req!⊃Method Path
                   $   ⍤@◌¬≍□"close"⬚∞get"Connection"⊸Req~Headers
                   $   &w Response ⍣⊓^0∘⋅⊃⋅^1⤚E~Response
                   $ )
        }
      }
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {
          P $ This function simply takes a list of static files to serve
            $ and a request, and if a valid file is requested, returns
            $ a simple 200 OK with the file and relevant MIME type.
        }
        ⬚∘Div {"class" "xl:col"} {
          UiuaCode $ # code type data ? valid request
                   $ Assets ← (
                   $   Req!⊃(
                   $     ⋅Path
                   $   | ≍"GET"⋅Method
                   $     ⍤"Assets must be accessed with GET"
                   $   | ⍤"No asset declared"∊⊙□⊙Path
                   $   )
                   $   "200 OK" map∩□"Content-Type" ⊃Mime&frab↘₁
                   $ )
        }
      }
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {
          P {
            $ There is another macro called
            Code "MakeRoutes!"
            $ that takes a string literal which represents the base path
            $ to a directory that contains pages to serve. More specifically,
            $ Uiua files will be inspected for a new type of semantic comment:
            Code "# Route! {method} {path}"
            $ . This should be right above a function. The function will then
            $ be considered a route, and will be included in the generated router.
            $ The method can be GET or POST as of right now and the path can contain
            $ underscores which will then result in parameterized routes.
            $ The generated code imports all necessary files and creates a function
            Code "Routes"
            $ that dispatches to relevant functions.
          }
        }
        ⬚∘Div {"class" "xl:col"} {
          P $ This is the generated code for this website:
          UiuaCode $ Index ~ "pages/index.ua"
                   $ Base ~ "pages/base.ua"
                   $ About ~ "pages/about.ua"
                   $ ProjectsIndex ~ "pages/projects/index.ua"
                   $ ProjectsWeb ~ "pages/projects/web.ua"
                   $ ProjectsGames ~ "pages/projects/games.ua"
                   $ ProjectsLenia ~ "pages/projects/lenia.ua"
                   $ Contact ~ "pages/contact.ua"
                   $ 
                   $ Routes ← ⍣(
                   $   ⍩Index~Index ⊓°("GET")°("/")
                   $ | ⍩Base~Deactivate ⊓°("GET")°("/htmx/header/inactive")
                   $ | ⍩Base~Activate ⊓°("GET")°("/htmx/header/active")
                   $ | ⍩About~Get ⊓°("GET")°("/about-me")
                   $ | ⍩ProjectsIndex~Get ⊓°("GET")°("/projects")
                   $ | ⍩ProjectsWeb~It ⊓°("GET")°("/projects/web")
                   $ | ⍩ProjectsGames~It ⊓°("GET")°("/projects/uiua-games")
                   $ | ⍩ProjectsLenia~It ⊓°("GET")°("/projects/lenia")
                   $ | ⍩Contact~Get ⊓°("GET")°("/contact")
                   $ | ⍤"No route declared"0
                   $ )⊸Req!⊃Method Path
        }
      }
    }
  
    Div {
      H₄ Code $ http.ua
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {}
        ⬚∘Div {"class" "xl:col"} {}
      }
    }
  
    Div {
      H₄ Code $ html.ua
      ⬚∘Div {"class" "row"} {
        ⬚∘Div {"class" "xl:col-6"} {}
        ⬚∘Div {"class" "xl:col"} {}
      }
    }
  }
}
