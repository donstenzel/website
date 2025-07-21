~ "../../hypertext.ua/html.ua"
  ~ Code Div H₁ H₂ Img LI P UL
~ "../base" ~ Layout UiuaCode

# card ? title img desc
ExampleCard ← (
  ⬚∘Div [{"class" "card"}
         {"style" "min-width: 350px; max-width: 350px;"}
  ] ⊓{
    ⬚∘Div {"class" "card__container"} ⊓{
      ⬚∘Div [{"class" "card-image"}
             {"style" $"background-image: url('_')"}
      ] ⊙{}
    | ⬚∘P {"class" "title u-text-center"}
      ⬚∘Div {"class" "card__title-container"}
    }
  | ⬚∘Div {"class" "content u-text-center"} P
  } :
)

# code type content ? request
# Route! GET /projects/lenia
It ← Layout {}⋅{
  H₁ "Lenia in Uiua"

  P $ I initially learned of Conway's Game of Life, and
    $ eventually saw a video about Lenia on the internet.
    $ I was immediately intrigued, but at the time I was
    $ not capable of implementing it myself.
    $ 
    $ I was working a lot with Uiua because of Advent of Code
    $ 2024, which led to working with simple cellular automata.
    $ This then caused me to look further into Lenia, where I
    $ discovered a great tutorial, which walked through a Python
    $ implementation. Luckily, Numpy was used, so translation
    $ was rather simple.

  P $ We start off by defining a couple of helper functions:
  UL {
    LI Div {
      P $ First, a function to create a grid of distances to the
        $ origin, for use in kernel generation.
      UiuaCode $ Grid ← ⌵˙⊞ℂ-⊃÷₂⇡
    }
    LI Div {
      P $ This function rotates an array to make its center
        $ appear along the edges of the array.
        $ To apply the fourier transformation correctly,
        $ we need to shift the kernel like this.
      UiuaCode $ Shift ← ↻⌈÷₂⊸△
    }
    LI Div {
      P $ This is the central piece that makes running this viable:
      UiuaCode $ Conv  ← ×√/×⊸△ ◌°ℂ ⍜∩fft×
      P $ This function convolves two arrays (of the same shape).
        $ We only care about the real part, so we can ignore the
        $ imaginary component. Because of the way Uiua's FFT works,
        $ we need to scale everything by the number of
        $ elements. `length deshape` would also work, but this
        $ way is much faster (unless optimized).
    }
    LI Div {
      P $ This is just a simple bell curve.
      UiuaCode $ Bell ← ₑ¯÷⟜ⁿ2˜÷˜-
    }
  }

  P $ With those functions at our disposal, we can now begin
    $ working on the main Lenia logic. For now, we will focus
    $ on a single channel of states.

  ⬚∘Div{"class" "row"} {
    ⬚∘Div {"class" "xl:col-6"} {
      P $ We need to generate a ring kernel, based on the following factors:
      UL {
        LI $ the kernel radius R
        LI $ the world size Ws
        LI $ the kernel peaks β
      }
    }
    ⬚∘Div {"class" "xl:col"}
    UiuaCode $ Kernel ← memo(
             $   ×◡⋅⧻ ÷⊙Grid
             $   ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
             $   Shift ÷/+⊸♭
             $ )
  }
  P $ We memoize the kernel generation, to save some time later.
    $ We start by making a grid of the specified world size,
    $ then scale it by the inverse kernel radius, and the number
    $ of peaks. Now we do two actions:
  UL {
    LI $ We select from the peak heights, filling with 0 when
       $ the points are too far away.
    LI $ We apply the bell curve function to the decimal part of the distance.
  }
  P $ These two masks are then multiplied. This creates rings at certain radii
    $ with the given peaks. We divide all values by their sum, s.t. the sum
    $ is 1 afterwards. Finally, we shift the kernel for convolution.

  ⬚∘Div {"class" "row"} {
    ⬚∘Div {"class" "xl:col-6"} {
      P $ The heart of the simulation is the step function. It has the
        $ following parameters:
      UL {
        LI $ the world state W (must be a square grid)
        LI $ the time scale T
        LI $ the kernel radi(i/us) R
        LI $ the (sets of) kernel peaks β
        LI $ the growth center(s) μ
        LI $ the growth width(s) σ
      }
      P $ All inputs can be supplied once or per kernel.
    }
  
    ⬚∘Div {"class" "xl:col-6"}
    UiuaCode $ # W ? W R β μ σ T
             $ U ← ↥₀↧₁ +⟜(
             $   ˜∩:⊃⧻¤
             $   ≡(Conv◇Kernel)
             $   ÷⊃(×⧻|/+) -₁×₂Bell
             $ )
  }

  P $ We start off by getting the world size and preparing some things for
    $ the convolutions. We then generate the kernels and convolve each
    $ with the original world state. Next, we apply the bell function with
    $ relevant growth centers and widths and readjust the output slightly.
    $ Finally, we divide the sum of the convolutions by the number of kernels
    $ and the time step.
    $ This represents the change of the current step, so we add it to the
    $ original world state and clamp the values to [0, 1]

  Div {
    P $ Simulating a number of frames is now trivial:
    UiuaCode $ Sim ← ⍥⤚⊸₅U
    P $ The inputs are the same as the step function,
      $ plus the number of frames up front. Now we are ready
      $ to look at some examples.
  }

  ⬚∘Div {"class" "u-flex u-gap-2 u-flex-wrap"} {
    ExampleCard "Orbium" "/assets/orbium.gif"
    $ This gif shows Orbium, probably the best known
    $ glider in Lenia.
  
    ExampleCard "Wanderer" "https://github.com/donstenzel/lenia/raw/main/visualizations/wanderer.gif"
    $ With a slight change to the growth function,
    $ now using asymptotic growth, we get smoother
    $ creatures like the wanderer.
  
    ExampleCard "Fish" "https://github.com/donstenzel/lenia/blob/main/visualizations/fish.gif?raw=true" ""
  }

  P $ This is not all though. There is a big extension that we have not yet
    $ explored. Instead of a single channel with values from 0 to 1, we
    $ can have multiple channels. This gives more expressive power, and allows
    $ for more complex behavior to emerge. One such example is the smooth glider
    $ gun.

  ⬚∘Div {"class" "row"} {
    ⬚∘Div {"class" "xl:col-6"} {
      P $ The kernel function now considers the relative kernel radii,
        $ but stays mostly unchanged.
    
      P $ The parameters are slightly expanded:
      UL {
        LI $ the channels (current state) Cs 
        LI $ the input channel indeces C₀
        LI $ the time scale T
        LI $ the kernel radius R
        LI $ the relative kernel radii ρ
        LI $ the kernel peaks β
        LI $ the growth centers μ, widths σ and heights H
        LI $ the output channel indeces C₁
      }
    }
  
    ⬚∘Div {"class" "xl:col-6"} {
      UiuaCode $ Kernel ← memo(
               $   ×◡⋅⧻ ÷⊃⋅×Grid
               $   ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
               $   Shift ÷/+⊸♭
               $ )
    
      UiuaCode $ # Cs ? Cs C₀ R ρ β μ σ H C₁ T
               $ U ← ↥₀↧₁ +⟜(
               $   ⧻⤚⊓⊢⊙⊙∘˜⊏
               $   ≡(Conv◇Kernel)
               $   ˜÷˜⊕/+×-₁×₂Bell
               $ )
    }
  }
  ⬚∘Div {"class" "u-flex u-gap-2 u-flex-wrap"} {
    ExampleCard @\s "https://github.com/donstenzel/lenia/raw/main/visualizations/emitter.gif"
    $ The main body spawns smaller gliders that can survive on their own.
  
    ExampleCard "Tesselatium" "https://github.com/donstenzel/lenia/raw/main/visualizations/tesselatium-gyrans.gif"
    $ This gif shows many creatures of the same type
    $ being able to collide and remain alive.
  }
}

# $ # In the multi channel version, the output is
# $ # inherently colored.
# $ ┌─╴Multi
# $   # Ws R ρ β
# $   Kernel ← memo(
# $     ×◡⋅⧻ ÷⊃⋅×Grid
# $     ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
# $     Shift ÷/+⊸♭
# $   )
# $ 
# $   # The parameters are as follows:
# $   #  - Cs ← channels = current state
# $   #  - C₀ ← input channel indeces
# $   #  - T ← time scale
# $   #  - R ← kernel radius
# $   #  - ρ ← relative kernel radii
# $   #  - β ← kernel peaks
# $   #  - μ, σ, H ← growth centers, -widths & -heights
# $   #  - C₁ ← output channel indeces
# $   # Cs ? Cs C₀ R ρ β μ σ H C₁ T
# $   U ← ↥₀↧₁ +⟜(
# $     ⧻⤚⊓⊢⊙⊙∘˜⊏
# $     ≡(Conv◇Kernel)
# $     ˜÷˜⊕/+×-₁×₂Bell
# $   )
# $ 
# $   # The parameters are as follows:
# $   #  - Cs ← channels = current state
# $   #  - C₀ ← input channel indeces
# $   #  - T ← time scale
# $   #  - R ← kernel radius
# $   #  - ρ ← relative kernel radius
# $   #  - β ← kernel peaks
# $   #  - μ, σ, H ← growth centers, -widths & -heights
# $   #  - C₁ ← output channel indeces
# $   # anim ? frames Cs C₀ R ρ β μ σ H C₁ T
# $   Sim ← ⍥⊃⊸₉U⍉
# $ └─╴
