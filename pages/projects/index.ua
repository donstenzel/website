~ "../../base" ~ Layout
~ "../../hypertext.ua/html"
  ~ A Div H₁ H₂ Img P Style

# card ? title link img desc
ProjectCard ← ⬚∘Div [{"class" "card"} {"style" "min-width: 350px; max-width: 350px;"}] ⊓{
  ⬚∘Div {"class" "card__container"} ⊓{
    ⬚∘Div {"class" "card__title-container"} ⬚∘P {"class" "title font-bold"}
  | ⬚∘Div [{"class" "card-image"} {"style" $"background-image: url('_')"}] ⊙{}
  }
| ⬚∘Div {"class" "content u-text-center"} P
| ⬚∘Div {"class" "card__action-bar u-text-center"} ⬚∘A [{"class" "u u-LR"} {"href" ∘}] ⊙"Read more..."
} ⊙⤚⋅⊙∘

# start with a small section on what to expect
# lots of uiua
# programming languages
# then cards per project with link

# Route! GET /projects
Get ← Layout {}⋅⋅{
  ⬚∘Div {"class" "section"} {
    H₁ "My personal projects"
  
    P $ These are my personal projects that are more or less worth
      $ showing off. Expect a lot of Uiua, as it is my favorite
      $ programming language for a bunch of reasons. My interests
      $ are programming languages in general, video games and
      $ I guess all around DIY stuff and home automation things?
  }
  ⬚∘Div {"class" "section"} {
    H₂ "Find out more about..."
    ⬚∘Div {"class" "u-flex u-flex-wrap u-gap-4 u-items-center"} {
      ProjectCard "Lenia" "/projects/lenia" "/assets/orbium.gif"
      $ Implementing Lenia, a state,
      $ time, and space continuous cellular
      $ automaton.
    
      ProjectCard "Uiua Games" "/projects/uiua-games" "/assets/bejeweled.gif"
      $ Creating video games in Uiua using
      $ the Iris library.
    
      ProjectCard "Web" "/projects/web" ""
      $ Tools for website creation in Uiua,
      $ like templating and routing.
    }
  }
}
