~ "../hypertext.ua/html"
  ~ A Body Div Head Header Html Link Meta Script
  ~ Code H₆ LI Main Nav Pre Span Style UL

# code type data ? html
Doc ← "200 OK" "text/html" utf₈

HeaderInactive ← (
  ⬚∘Div [{"class" "section header header-fixed u-unselectable header-light"}
         {"style" "backdrop-filter: blur(8px); background-color: hsla(0, 0%, 100%, 0.8)"}
         {"id" "header"}
  ] {
    ⬚∘Div {"class" "header-brand"} {
      ⬚∘Div {"class" "nav-item no-hover"} ⬚∘A {"href" "/"} H₆ "dev.stenzel"
      ⬚∘Div [{"class" "nav-item nav-btn"}
             {"hx-get" "/htmx/header/active"}
             {"hx-target" "#header"}
             {"hx-swap" "outerHTML"}
      ] {Span {} Span {} Span {}}
    }
  
    ⬚∘Div {"class" "header-nav"}
    ⬚∘Div {"class" "nav-right"} {
      ⬚∘Div {"class" "nav-item has-sub toggle-hover"} {
        ⬚∘A [{"class" "nav-dropdown-link"} {"href" "/projects"}] "Projects"
        ⬚∘UL {"class" "dropdown-menu dropdown-animated"} {
          LI ⬚∘A {"href" "/projects/lenia"} "Lenia"
          LI ⬚∘A {"href" "/projects/uiua-games"} "Uiua Games"
          LI ⬚∘A {"href" "/projects/web"} "Web"
        }
      }
      ⬚∘Div {"class" "nav-item"} ⬚∘A {"href" "/about-me"} "About"
      ⬚∘Div {"class" "nav-item"} ⬚∘A {"href" "/contact"} "Contact"
    }
  }
)

# Route! GET /htmx/header/inactive
Deactivate ← Doc HeaderInactive ⋅◌

HeaderActive ← (
  ⬚∘Div [{"class" "section header header-fixed u-unselectable header-light"}
         {"style" "backdrop-filter: blur(8px); background-color: hsla(0, 0%, 100%, 0.8)"}
         {"id" "header"}
  ] {
    ⬚∘Div {"class" "header-brand"} {
      ⬚∘Div {"class" "nav-item no-hover"} ⬚∘A {"href" "/"} H₆ "dev.stenzel"
      ⬚∘Div [{"class" "nav-item nav-btn active"}
             {"hx-get" "/htmx/header/inactive"}
             {"hx-target" "#header"}
             {"hx-swap" "outerHTML"}
      ] {Span {} Span {} Span {}}
    }
  
    ⬚∘Div {"class" "header-nav active"}
    ⬚∘Div {"class" "nav-right"} {
      ⬚∘Div {"class" "nav-item has-sub toggle-hover"} {
        ⬚∘A [{"class" "nav-dropdown-link"} {"href" "/projects"}] "Projects"
        ⬚∘UL {"class" "dropdown-menu dropdown-animated"} {
          LI ⬚∘A {"href" "/projects/lenia"} "Lenia"
          LI ⬚∘A {"href" "/projects/uiua-games"} "Uiua Games"
          LI ⬚∘A {"href" "/projects/web"} "Web"
        }
      }
      ⬚∘Div {"class" "nav-item"} ⬚∘A {"href" "/about-me"} "About"
      ⬚∘Div {"class" "nav-item"} ⬚∘A {"href" "/contact"} "Contact"
    }
  }
)

# Route! GET /htmx/header/active
Activate ← Doc HeaderActive ⋅◌

# code type page ? head body
Layout ← Doc Html⊙{
  Head ⊂{
    # Cirrus UI
    Link [{"rel" "stylesheet"}
          {"href" "https://unpkg.com/cirrus-ui"}]
  
    # Cirrus UI required fonts
    Link [{"rel" "stylesheet"}
          {"href" "https://fonts.googleapis.com/css?family=Montserrat:400,700"}]
    Link [{"rel" "stylesheet"}
          {"href" "https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700"}]
  
    # HTMX
    ⬚∘Script {"src" "/htmx.min.js"} {}
    # Deindenting of code blocks
    ⬚∘Script [{"src" "/deindent.js"}
              {"defer" ""}
    ] {}
  
    # Icon
    Link [{"rel" "icon"}
          {"type" "image/png"}
          {"sizes" "16x16"}
          {"href" "/assets/icon/favicon-16x16.png"}]
    Link [{"rel" "icon"}
          {"type" "image/png"}
          {"sizes" "32x32"}
          {"href" "/assets/icon/favicon-32x32.png"}]
    Link [{"rel" "apple-touch-icon"}
          {"sizes" "180x180"}
          {"href" "/assets/icon/apple-touch-icon.png"}]
    Link [{"rel" "icon"}
          {"type" "image/png"}
          {"sizes" "192x192"}
          {"href" "/assets/icon/android-chrome-192x192.png"}]
    Link [{"rel" "icon"}
          {"type" "image/png"}
          {"sizes" "512x512"}
          {"href" "/assets/icon/android-chrome-512x512.png"}]
  
    # Uiua Font
    Style $ @font-face {
          $   font-family: 'Uiua386';
          $   src: url('/assets/Uiua386.woff2') format('woff2'),
          $        url('/assets/Uiua386.woff') format('woff');
          $   font-weight: normal;
          $   font-style: normal;
          $ }
  
    # Responsive viewport
    Meta [{"name" "viewport"}
          {"content" "width=device-width, initial-scale=1"}]
  
    # Encoding
    Meta {"charset" "UTF-8"}
  }
| Body Div {
    HeaderInactive
    ⬚∘Main {"class" "section my-8 w-80p mx-auto"}
  }
}

UiuaCode ← Pre □ ⬚∘Code ⊂⍣°◌[] {"style" "font-family: Uiua386"}
