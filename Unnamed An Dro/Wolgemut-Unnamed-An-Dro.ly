\version "2.26.0"


\header {
  title = "  An Dro"
  composer = "Wolgemut"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

melodyA = {
  \repeat volta 2 {
    e'8^"Intro" f' e'8. d'16 | \tuplet 3/2 {c'16 d'16 c'16 } b8 a b16 c' | d'8 d' b g | a16 b c' d' e'8 a8 | 
    e'8 f' e'8. d'16 | \tuplet 3/2 {c'16 d'16 c'16 } b8 a b16 c' | d'8 d' b g
    
      \alternative {
    \volta 1 { a16 b c' b a4 | }
    \volta 2 { \tuplet 3/2 { a16 b c' } \tuplet 3/2 { d'16 c'16 b } a4 | }
  }
  }
}


melodyB = {
  \repeat volta 2 {
  e'8^"A" e' a4 | e'8 e'16 c' b8 b16 c' | d'8 d' b g | a16 b c' d' e' b c' d' | 
  e'8 e' a4 | e'8 e'16 c' b8 b16 c' | d'8 d' b g | a16 b c' b a4 |
  }
}

melodyC = {
  \repeat volta 2 {
  e'8^"B" d'16 e' f'8 d' | d'8 c'16 d' e'8 c' | a8 g16 a b8 d'8 | c'16 b a g a b c' d' |
  e'8 d'16 e' f'8 d' | d'8 c'16 d' e'8 c' | a8 g16 a b8 d'8 | c'16 b a g a4 |
  }
}

melodyD = {
  \repeat volta 2 {
    a8^"C" g16 a b8 d'8 | c'16 b a g a b c' b | a8 g16 a b8 d'8 | c'16 b a g a4
  }
}


music = {
  \time 2/4
  \key a \minor
  \tempo 4 = 100
  \melodyA
  \melodyB
  \melodyC
  \melodyD
}

\markup { A, B, C, D, A, B, C, D (drum solo), B, C, D }

\score {
  \music
  \layout {
    \context {
      \Staff \RemoveEmptyStaves 
    }
  }
}

% Second score block with unfolded repeats so that they render in midi
\score {
  \unfoldRepeats {  \music }
  \midi {}
}
