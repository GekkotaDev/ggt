#import "@preview/ilm:2.1.1": *

#import "pages/prelude.typ": *

#set pagebreak(
  weak: false,
)

#set text(lang: "en")

#set text(lang: "en", font: "IBM Plex Serif")
#show table: set text(font: "IBM Plex Serif", size: 11pt, kerning: true)
#show math.equation: set text(font: "Fira Math")
#show raw: set text(font: "Fira Code")
#show image: set text(font: "Fira Code")

#let code(content, caption: "") = {
  let figure_caption = none
  let figure_supplement = none

  set par(justify: false)

  if caption.len() > 0 {
    figure_caption = caption
    figure_supplement = "Figure"
  }

  figure(
    block(
      // fill: luma(250),
      radius: 3pt,
      // stroke: .6pt + luma(200),
      inset: (x: .45em, y: .65em),
      width: 100%,
      clip: false,
      [#align(left)[#content]],
    ),
    caption: figure_caption,
    supplement: figure_supplement,
    kind: "code",
  )
}

#show: ilm.with(
  title: [
    \<title\>
    \
    Game Design Document
  ],
  authors: (
    "Author #1"
  ),
  date-format: "[year repr:full] [month repr:long] [day padding:zero]",
  date: datetime.today(),

  abstract: [
    Copyright #sym.copyright \<team\>
  ],

  preface: [
    #align(center + horizon)[
      \<elevator pitch\>
      #inline-note[
        Write this section last; 1 - 2 sentences to \
        convince someone to play your game
      ]
    ]
  ],

  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)


#include "pages/0000.cover.typ"
#include "pages/0010.revision-table.typ"
#include "pages/0020.executive-summary.typ"
#include "pages/0030.core-gameplay-loop.typ"
#include "pages/0040.game-systems.typ"
// #include "pages/0050.progression.typ"
// #include "pages/0050.narrative.typ"

#pagebreak()
