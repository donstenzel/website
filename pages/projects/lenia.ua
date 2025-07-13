~ "../../hypertext.ua/html.ua"
  ~ Code Div H₁ H₂ LI P UL
~ "../../base" ~ Layout UiuaCode

# code type content ? headers payload
# Route! GET /projects/lenia
It ← Layout {}⋅⋅{
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

  Div {
    Div {
      P $ We need to generate a ring kernel, based on the following factors:
      UL {
        LI $ the kernel radius R
        LI $ the world size Ws
        LI $ the kernel peaks β
      }
      P $ Here's the code that does this for us:
      UiuaCode $ Kernel ← memo(
               $   ×◡⋅⧻ ÷⊙Grid
               $   ×⊃(⬚0⊏⌊|Bell ⊙0.5 ⊙0.15 ◿₁)
               $   Shift ÷/+⊸♭
               $ )
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
    }
  
    Div {
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
        $ Here's the code:
      UiuaCode $ # W ? W R β μ σ T
               $ U ← ↥₀↧₁ +⟜(
               $   ˜∩:⊃⧻¤
               $   ≡(Conv◇Kernel)
               $   ÷⊃(×⧻|/+) -₁×₂Bell
               $ )
      P $ We start off by getting the world size and preparing some things for
        $ the convolutions. We then generate the kernels and convolve each
        $ with the original world state. Next, we apply the bell function with
        $ relevant growth centers and widths and readjust the output slightly.
        $ Finally, we divide the sum of the convolutions by the number of kernels
        $ and the time step.
        $ This represents the change of the current step, so we add it to the
        $ original world state and clamp the values to [0, 1]
    }
  
    Div {
      P $ Simulating a number of frames is now trivial:
      UiuaCode $ Sim ← ⍥⤚⊸₅U
      P $ The inputs are the same as `U`, plus the number of frames up front.
    }
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
# $   #  - ρ ← relative kernel radius
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
