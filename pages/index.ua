~ "../hypertext.ua/html"
  ~ A Div H₁ H₂ H₃ Img P
~ "base" ~ Layout UiuaCode

# code type content ? headers payload
# Route! GET /
Index ← Layout {}⋅⋅{
  ⬚∘Div {"class" "u-center content m-2"} {
    ⬚∘Div {"class" "u-text-center"} {
      H₁ $ DEV.STENZEL
      H₃ $ RECREATIONAL PROGRAMMING
    }
    ⬚∘Div {"class" "space space--xl"} {}
    ⬚∘Div {"class" "row"} {
      ⬚∘Div {"class" "md:col-6"} {
        ⬚∘P {"class" "text-xl"} $ Welcome to my personal website!
      
        P $ I'm a recreational programmer from Germany.
          $ I love learning interesting programming languages and
          $ exploring different ideas.
      
        P {
          "You can check out my projects over" ⬚∘A {"href" "/projects"} "here"
          "or on my" ⬚∘A {"href" "https://github.com/donstenzel"} $ GitHub!
        }
      
        P {
          "I mostly program in" ⬚∘A {"href" "https://uiua.org"} "Uiua."
          $ In fact, this website is written almost entirely in Uiua.
        }
      }
      ⬚∘Div {"class" "u-gap-2 md:col-6"} {
        ⬚∘A {"href" "/projects/lenia"}
        Img [{"class" "u-round-md u-shadow-lg"}
             {"src" "https://github.com/donstenzel/lenia/blob/main/visualizations/squiggles.gif?raw=true"}]
      }
    }
  }
}
