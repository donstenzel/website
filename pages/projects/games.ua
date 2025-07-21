~ "../../hypertext.ua/html.ua"
  ~ A B Code Div H₁ H₂ H₃ H₄ Img LI P Span UL
~ "../base" ~ Layout

# code type content ? request
# Route! GET /projects/uiua-games
It ← Layout {}⋅{
  H₁ "Video games in Uiua"

  P {
    $ Making video games in Uiua is actually possible!
    $ There are bindings to raylib, which are wrapped by
    $ a lovely library called Iris, which can be found
    ⬚∘A {"href" "https://github.com/marcos-cat/iris"} $ here.
  
    $ Check out the repository to see the games people have
    $ made. On this page I will showcase the ones I made.
  }

  P $ The first game I made was simply wordle for the terminal.
    $ The code to this is not yet recovered from the depths of old
    $ devices.

  P $ Next, I wanted to make a slightly larger game, but for
    $ a long time I didn't really know what to do. One day,
    $ I decided to try my luck at implementing Snake.

  H₃ $ Snake
  ⬚∘Div {"class" "row"} {
    ⬚∘Div {"class" "xl:col-8"} {
      P $ So I want to make Snake... where do I even begin?
    
      P $ Breaking down Snake into the absolute minimum in my case boiled
        $ down to the position of the fruit, and the segments of the snake.
        $ We also need to store the direction of the snake. The head of the
        $ snake can just implicitly be the first element of the list of
        $ segments.
    
      P $ The functions we need are:
      UL {
        LI $ A function to create a new game state
        LI $ A function to update the direction of the player
        LI $ A function that updates the world state
        LI $ A function to render the world state
        LI $ Finally, a function that handles the game's
           $ state machine
      }
    
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
        $ This draws a message or the current world state.
        $ A game over is detected when the snake exits the map
        $ or collides with itself.
    
      P {
        $ With all that done, the game is ready to run! Check it out on my
        ⬚∘A {"href" "https://github.com/donstenzel/snake-uiua"} $ GitHub
      }
    }
  
    ⬚∘Div {"class" "xl:col-4"} {
      Img [{"class" "u-round-md u-shadow-lg"}
           {"src" "/assets/snake.gif"}]
    }
  }

  ⬚∘Div {"class" "space space--xl"} {}

  H₃ $ Bejeweled
  ⬚∘Div {"class" "row"} {
    ⬚∘Div {"class" "xl:col-8"} {
      P $ Again the goal is representing the game state in a simple
        $ way, so manipulation is easy but we keep all the necessary info.
        $ The game state consists of a grid of numbers that represents
        $ the glyphs on screen, the score, the number of turns left,
        $ and the first and second selection.
    
      P $ I had initially used integers which were indeces into a simple
        $ string of the available glyphs. I could then simply partition
        $ the positions by their values and run the matching logic.
    
      P $ Eventually, I decided to use a more complex encoding.
        $ The numbers we store are now floats, where the integer part
        $ is the color of glyph and the fractional part is the index
        $ into those glyphs. The benefit is that such an
        $ encoding is agnostic to the number of colors and glyphs.
        $ while making it easy to implement matching glyphs
        $ based on color and not exact matches. This is free by flooring
        $ our numbers and then partitioning the coordinates like before.
    
      P $ At the core of the game is yet another state machine loop.
        $ This way it's really easy to implement the game step by step.
    
      P $ We need the following states for our game:
      UL {
        LI $ An initial state that shows the welcome message
        LI $ Waiting on player selection
        LI $ Swapping two glyphs
        LI $ Scoring combinations
        LI $ Dropping glyphs one row
        LI $ Filling the top row with new glyphs
        LI $ A losing state that shows the game over message
        LI $ A winning state that shows the winning message
      }
    
      P $ I structured each state as a simple function that
        $ first determines the new state and then draws
        $ whatever is necessary.
    
      P $ Falling and filling happening over multiple steps was
        $ retro-fitted, but this was pretty simple to accomplish
        $ with the already established state machine. It creates
        $ a much needed animation effect.
    
      P {
        $ As usual, you can check out the game on my
        ⬚∘A {"href" "https://github.com/donstenzel/bejeweled-uiua"} $ GitHub
      }
    }
  
    ⬚∘Div {"class" "xl:col-4"} {
      Img [{"class" "u-round-md u-shadow-lg"}
           {"src" "/assets/bejeweled.gif"}]
    }
  }
}
