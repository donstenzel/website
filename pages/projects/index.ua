~ "../base" ~ Layout
~ "../../hypertext.ua/html"
  ~ A Div H₁ H₂ Img P Style

Image ← Style $$ @scope { .card-image { background-image: url('_'); } }

# style ? time images
Slide ← (
  Frames ← (
    ⊃⧻⍚$"{ background-image: url('_'); }"
    /$"_\n_"⍚$"    _ _"⊓(⬚@\s≡$"_%"⌊×1e2÷⤙⊂⊸⇡|⊂⟜⊢)
  )

  ⊙Frames
  Style $$ @scope {
        $$   .card-image {
        $$     animation: slideshow _s ease-in-out infinite;
        $$   }
        $$   
        $$   @keyframes slideshow {
        $$ _
        $$   }
        $$ }
)
# card ? title link img desc
ProjectCard ← ⬚∘Div [{"class" "card"} {"style" "min-width: 350px; max-width: 350px;"}] ⊓{
  ⬚∘Div {"class" "card__container"} ⊓{
    ⬚∘Div [{"class" "card-image"}] {} ∘
  | ⬚∘Div {"class" "card__title-container"} ⬚∘P {"class" "title u-text-center"}
  }
| ⬚∘Div {"class" "content u-text-center"} P
| ⬚∘Div {"class" "card__action-bar u-text-center"} ⬚∘A [{"class" "u u-LR"} {"href" ∘}] ⊙"Read more..."
} ˜∩:

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
      ProjectCard "Lenia" "/projects/lenia" Image "/assets/orbium.gif"
      $ Implementing Lenia, a state,
      $ time, and space continuous cellular
      $ automaton.
    
      ProjectCard "Uiua Games" "/projects/uiua-games" Image "/assets/bejeweled.gif"
      $ Creating video games in Uiua using
      $ the Iris library.
    
      ProjectCard "Web" "/projects/web" Slide 15 {"/assets/web-sample-01.png" "/assets/web-sample-02.png" "/assets/web-sample-03.png"}
      $ Tools for website creation in Uiua,
      $ like templating and routing.
    }
  }
}
