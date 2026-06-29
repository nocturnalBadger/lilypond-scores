\version "2.26.0"


\header {
  title = "Unnamed An Dro"
  composer = "Wolgemut"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

melodyA = {
  ^"A"
  \repeat volta 2 {
  e'8 f' a4 | e'8 e'16 c' b8 b16 c' | d'8 d' b g | a16 b c' b a b c' d' | 
  e'8 e' a4 | e'8 e'16 c' b8 b16 c' | d'8 d' b g | a16 b c' b a4 |
  }
}

melodyB = {
  ^"B"
  \repeat volta 2 {
  e'8 d'16 e' f'8 d' | d'8 c'16 d' e'8 c' | a8 g16 a b8 d'8 | c'16 b a g a b c' d' |
  e'8 d'16 e' f'8 d' | d'8 c'16 d' e'8 c' | a8 g16 a b8 d'8 | c'16 b a g a4 |
  }
}

melodyC = {
  ^"C"
  \repeat volta 2 {
    a8 g16 a b8 d'8 | c'16 b a g a b c' b | a8 g16 a b8 d'8 | c'16 b a g a4
  }
}


music = {
  \time 2/4
  \key a \minor
  \tempo 4 = 100
  \melodyA
  \melodyB
  \melodyC
}

\markup { A, B, C, A, B, C, (drum solo), A, B, C }

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
