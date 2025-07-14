~ "../../hypertext.ua/html.ua"
  ~ A B Code Div H₁ H₂ H₃ H₄ LI P Span UL
~ "../base" ~ Layout

# code type content ? headers payload
# Route! GET /projects/uiua-games
It ← Layout {}⋅⋅{
  H₁ "Video games in Uiua"

  P {
    $ Making video games in Uiua is actually possible!
    $ There are bindings to raylib, which are wrapped by
    $ a lovely library called Iris, which can be found
    ⬚∘A {"href" "https://github.com/marcos-cat/iris"} $ here.
  
    $ Check out the repository to see the games people have
    $ made. On this page I will showcase the ones I made.
  }

  P $ The first game I made was a simply wordle for the terminal.
    $ The code to this is not yet recovered from the depths of old
    $ devices.

  P $ Next, I wanted to make a slightly larger game, but for
    $ a long time I didn't really know what to do. One day,
    $ I decided to try my luck at implementing Snake.

  H₃ $ Snake
  Div {
    P $ So I want to make Snake... where do I even begin?
  
    P $ That question always comes up when creating any game
      $ I imagine. In Uiua's case, this is a bit more warranted,
      $ though, as you really need to think about what makes
      $ up the game's state, what you need to render when, and where...
  
    P $ Breaking down Snake into the absolute minimum in my case boiled
      $ down to the position of the fruit, and the segments of the snake.
      $ We also need to store the direction of the snake. The head of the
      $ snake can just implicitly be the first element of the list of
      $ segments.
  
    P $ The input was a little finicky, as I wanted to prevent
      $ the user from moving into the snake by pressing the
      $ opposite direction as they were currently going.
      $ Therefore, we include a little logic to not change direction
      $ when this situation occurs.
  
    P $ Moving the snake is actually really easy: we can just
      $ drop the last position, add the sum of the first
      $ position and the direction and push this value as the
      $ new head. When the snake moves onto the fruit, the tail
      $ is not dropped and a new fruit is generated.
  
    P $ I didn't want to look into loading textures and drawing them
      $ at the time so I decided to use Uiua's capabilities to create
      $ an image, which I can then draw on the screen.
  
    P $ At the core of the game is a simple state machine like loop
      $ that tracks whether the game is starting, running or ending.
  
    P {
      $ With all that done, the game is ready to run! Check it out on my
      ⬚∘A {"href" "https://github.com/donstenzel/snake-uiua"} $ GitHub
    }
  }

  H₃ $ Bejeweled
}
