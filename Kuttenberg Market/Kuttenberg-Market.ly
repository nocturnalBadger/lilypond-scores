\version "2.26.0"

\header {
  title = "Kuttenberg Market"
  composer = "Jan Valta and Adam Sporka"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

global = {
  \key a \dorian
  \time 4/4
  \accidentalStyle default
  \tempo 4 = 95
}


% fanfare intro
horn = {
  \global
  a, e8e e4 e e8. e16 g8 fis e2
}

melodyA = {
  a16 b c' d' |
  e'8. d'16 e'8. d'16  e'16 fis' g'8  fis'4 | e'8 c'16 e' g'8 fis'8 e'4 e' |
  e'8. d'16 e'8. d'16 e'16 fis' g' a'16 fis'4 | e'8 a16 b c' d' b8 a2 |
}

melodyB = {
  a16 b | 
  c' b a8 b4 c'16 b c' d' b4 |
  c'8 a16 b c' b c' d' e'4. a16 b | 
  c' b a8 b4 c'16 b c' d' b4 |
  c'8 a 32 b c' d' e'8 fis'16 g' a'2 |
}


melodyCPickup = {
  % plays 3 32nd notes in the time it would normally take to play 2, so a 16th
  \tuplet 3/2  { e'32 fis' g'} |
}

melodyC = {
    a'8 e'8 g'16 fis' e'8 a8 e' g'16 fis' e'8 |
    a'8 e'16 fis' g' fis' e'8 c'8 c'16 d' e'4 |
    a'8 e'8 g'16 fis' e'8 a16 d' e' a' g' fis' e'8 |
    a'8 e'16 fis' g' fis' e'8 fis'16 g' fis'8
}

music = {
  <<
    \new Staff = "Horns" {
      \set Staff.instrumentName = "Horns"
      \new Voice = "Horn"  \horn
    }

    \new Staff = "Recorder" {
      \set Staff.instrumentName = "Alto Recorder"
      \set Staff.shortInstrumentName = "rec."
      \new Voice = "Recorder"  {
        \global
        \transpose c c' {
          r1 r2.
          \melodyA
          R1*3 r2 r4.
          \melodyB
          R1*3 r16*15
          \melodyCPickup
          \melodyC a'4
        }
      }
    }
    \new Staff = "Crumhorn" {
      \set Staff.instrumentName = "Crumhorn"
      \set Staff.shortInstrumentName = "crum."
      \new Voice = "Crumhorn" {
        \global
        R1*5 r2 r4
        \melodyA
        R1*3 r16*15 % rest for all but the last 16th for a pickup
        \melodyCPickup
        \repeat volta 2 {
          \melodyC
          \alternative {
            \volta 1 { e'4 }
            \volta 2 { a'4 }
          }
        }
      }
    }
  >>
}

\score {
  \music
  \layout {}
}

% Second score block with unfolded repeats so that they render in midi
\score {
  \unfoldRepeats {  \music }
  \midi {}
}
