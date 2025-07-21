~ "../hypertext.ua/html.ua"
  ~ A B Code Div H₁ H₂ H₄ LI P Span UL
~ "base.ua" ~ Layout

# Route! GET /contact
Get ← Layout {}⋅{
  H₁ "Contact me"

  P $ If you wish to contact me, there are a couple of ways.
  H₄ "Email"
  P $ bennetstenzel7@gmail.com

  H₄ "Platforms"
  Div {
    P {
      B "GitHub:"
      ⬚∘A {"href" "https://github.com/donstenzel"} "https://github.com/donstenzel"
    }
    P {
      B "Discord:"
      Span "@bennet7"
    }
  }

  P $ I usually lurk on the Uiua discord server so the chance of catching me there
    $ is very high!
}
