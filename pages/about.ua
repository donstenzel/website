~ "../hypertext.ua/html.ua"
  ~ A B Code Div H₁ H₂ H₄ LI P Span UL
~ "base.ua" ~ Layout

# Route! GET /about-me
Get ← Layout {}⋅{
  H₁ "About me"

  P $ I am a recreational programmer from Germany. I love
    $ creating interesting software in my free time.
    $ I'm also currently doing an apprenticeship to
    $ become a "certified" software developer.
    $ I also enjoy playing video games from time to time,
    $ like Minecraft and roguelikes.

  H₂ "Programming"
  Div {
    P $ I started programming with lego when I was a kid,
      $ using a mindstorms robot. Later, I was actually able
      $ to do this in school, which was an amazing opportunity.
      $ I've always had a love for computers, but I didn't
      $ properly get into programming until I decided to pursue
      $ it as a career. This was after I dropped out of studying
      $ mathematics, which I noticed was not my cup of tea.
  
    P $ When I got into actual programming, it was like a world
      $ of possibilities opened up. I have always enjoyed logic
      $ puzzles, and programming is exactly like that to me.
      $ In fact, the process of programming is remarkably similar
      $ to how I approach certain Minecraft modpacks, and the
      $ explorative nature of the game and its mods reflects
      $ programming nicely.
  
    P $ Ever since then, I have been learning more and more
      $ languages, since most have their own special ideas that
      $ are worth looking into and considering. At work I use
      $ C# and Xaml to collaborate on a website and mobile app.
      $ In my free time I mostly enjoy more esoteric programming
      $ languages like Uiua and Raku. This is because these
      $ languages do not shy away from trying out wild ideas,
      $ and offer a lot of expressive power to the user. I also
      $ love mini-languages made for specific purposes.
  
    P $ I plan on making my own programming language(s) at
      $ some point, but right now I do not have enough concrete
      $ ideas nor enough expertise to properly take on this
      $ project.
  }

  H₂ "Video games"
  Div {
    P $ I enjoy playing video games, though the amount that I play
      $ has decreased drastically since I was a child.
      $ I really like games that make you to think a lot
      $ and let you be creative in how you solve problems.
  
    P $ There's a lot of games I like, but I don't feel
      $ strongly about most of them to really highlight them.
      $ The only exception is probably Minecraft, which I think
      $ has actually contributed to teaching me how to learn.
      $ I played a lot of modpacks when I was younger (still do!)
      $ and this required scouring random posts and wikis on the
      $ internet to find information. This has nicely transferred
      $ into being able to quickly understand APIs.
  
    P $ I actually also have a competitive side, I played a lot
      $ of Overwatch when it came out and League of Legends
      $ during the pandemic. I tend to get frustrated after a
      $ while though, which is why I have completely quit such
      $ games. Not to mention that LoL literally does not work
      $ on my machine any more.
  }
}
