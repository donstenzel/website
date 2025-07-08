~ "hypertext.ua/html"
  ~ A Body Div Head Header Html Link Meta Script
  ~ Code Main Nav Span

# page ? head body
Layout ← Html⊙{
  Head⊂{
    # Material Design Lite
    Link [{"rel" "stylesheet"}
          {"href" "/mdl/material.min.css"}]
    Link [{"rel" "stylesheet"}
          {"href" "https://fonts.googleapis.com/icon?family=Material+Icons"}]
    ⬚[{"src" "/mdl/material.min.js"}]Script {}
  
    # HTMX
    ⬚[{"src" "/htmx.min.js"}]Script {}
  
    # Icon
    Link [{"rel" "icon"}
          {"type" "image/png"}
          {"sizes" "16x16"}
          {"href" "/assets/icon/favicon-16x16.png"}]
    Link [{"rel" "icon"}
          {"type" "image/png"}
          {"sizes" "32x32"}
          {"href" "/assets/icon/favicon-32x32.png"}]
    Link [{"rel" "manifest"}
          {"href" "/assets/icon/site.webmanifest"}]
    Link [{"rel" "apple-touch-icon"}
          {"sizes" "180x180"}
          {"href" "/assets/icon/apple-touch-icon.png"}]
  
    Meta [{"charset" "UTF-8"}]
  }
| Body {
    ⬚∘Div [{"class" "mdl-layout mdl-js-layout"}] {
      ⬚∘Header [{"class" "mdl-layout__header mdl-layout__header--transparent"}] {
        ⬚∘Div [{"class" "mdl-layout__header-row"}] {
          ⬚∘Span [{"class" "mdl-layout-title"}] "Pages"
        
          ⬚∘Div [{"class" "mdl-layout-spacer"}] {}
        
          ⬚∘Nav [{"class" "mdl-navigation"}] {
            ⬚∘A [
              {"class" "mdl-navigation__link"}
              {"href" "/"}
            ] "Home"
            ⬚∘A [
              {"class" "mdl-navigation__link"}
              {"href" "/lenia/"}
            ] "Lenia"
            ⬚∘A [
              {"class" "mdl-navigation__link"}
              {"href" "/about-me/"}
            ] "About me"
          }
        }
      }
      ⬚∘Div [{"class" "mdl-layout__drawer"}] {
        ⬚∘Span [{"class" "mdl-layout-title"}] "Pages"
      
        ⬚∘Nav [{"class" "mdl-navigation"}] {
          ⬚∘A [
            {"class" "mdl-navigation__link"}
            {"href" "/"}
          ] "Home"
          ⬚∘A [
            {"class" "mdl-navigation__link"}
            {"href" "/lenia/"}
          ] "Lenia"
          ⬚∘A [
            {"class" "mdl-navigation__link"}
            {"href" "/about-me/"}
          ] "About me"
        }
      }
      ⬚∘Main [{"class" "mdl-layout__content"}]
    }
  }
}

UiuaCode ← ⬚∘Code ⊂⍣°◌[] [{"style" "font-family: Uiua386; white-space: pre;"}]
# &p Layout {} {}
