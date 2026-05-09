// ══════════════════════════════════════════
//  STYLES COMMUNS — Guide Typst
// ══════════════════════════════════════════

#let bleu    = rgb("#1A6B9A")
#let bleu2   = rgb("#2E86AB")
#let vert    = rgb("#27AE60")
#let rouge   = rgb("#C0392B")
#let violet  = rgb("#6C3483")
#let orange  = rgb("#CA6F1E")
#let gris    = rgb("#F2F3F4")
#let grisc   = rgb("#BDC3C7")

// ── Titres ──────────────────────────────
#let style-titres() = {
  show heading.where(level: 1): it => {
    v(0.5cm)
    block(width: 100%, fill: bleu, inset: (x: 14pt, y: 10pt), radius: 7pt)[
      #text(fill: white, weight: "bold", size: 15pt)[#it.body]
    ]
    v(0.5em)
  }
  show heading.where(level: 2): it => {
    v(0.9em)
    grid(columns: (4pt, 1fr), gutter: 8pt,
      rect(width: 4pt, height: 18pt, fill: bleu2, radius: 2pt),
      align(horizon)[#text(fill: bleu2, weight: "bold", size: 12.5pt)[#it.body]]
    )
    v(0.3em)
  }
  show heading.where(level: 3): it => {
    v(0.6em)
    text(fill: violet, weight: "bold", size: 11pt)[#it.body]
    v(0.15em)
    line(length: 60%, stroke: 0.4pt + violet.lighten(50%))
    v(0.2em)
  }
}

// ── Raw blocks ──────────────────────────
#let style-code() = {
  show raw.where(block: true): it => block(
    width: 100%,
    fill: rgb("#1e1e2e"),
    inset: 11pt,
    radius: (bottom-left: 5pt, bottom-right: 5pt, top-left: 0pt, top-right: 0pt),
    stroke: (bottom: 0.6pt + grisc, left: 0.6pt + grisc, right: 0.6pt + grisc),
  )[#text(font: "Liberation Mono", size: 9pt, fill: rgb("#CDD6F4"), it)]
}

// ── Utilitaires ─────────────────────────
#let hl(col, cont) = highlight(fill: col.lighten(65%), cont)

#let ex(titre) = {
  v(0.6em)
  block(
    width: 100%, fill: bleu.lighten(88%),
    stroke: (top: 0.6pt + grisc, left: 0.6pt + grisc, right: 0.6pt + grisc),
    inset: (x: 10pt, y: 5pt),
    radius: (top-left: 5pt, top-right: 5pt),
  )[#text(fill: bleu, weight: "bold", size: 9pt)[Exemple — #titre]]
}

#let memo(titre, cont) = block(
  width: 100%, fill: orange.lighten(88%),
  stroke: (left: 3pt + orange, rest: 0.5pt + orange.lighten(60%)),
  inset: 11pt, radius: (right: 6pt),
)[
  #text(fill: orange, weight: "bold", size: 10pt)[📌 MÉMO — #titre]
  #v(0.3em)
  #cont
]

#let tip(cont) = block(
  width: 100%, fill: vert.lighten(88%),
  stroke: (left: 3pt + vert), inset: 10pt, radius: (right: 5pt),
)[#text(fill: vert, weight: "bold")[✓ Astuce] — #cont]

#let warn(cont) = block(
  width: 100%, fill: rouge.lighten(88%),
  stroke: (left: 3pt + rouge), inset: 10pt, radius: (right: 5pt),
)[#text(fill: rouge, weight: "bold")[⚠ Attention] — #cont]

// ── En-tête/pied de page ────────────────
#let page-style(chapitre, num) = {
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.8cm, left: 2.8cm, right: 2.3cm),
    header: context {
      set text(size: 8pt, fill: grisc)
      grid(columns: (1fr, auto),
        align(left)[Guide Complet Typst — #chapitre],
        align(right)[Fascicule #num]
      )
      line(length: 100%, stroke: 0.4pt + grisc)
    },
    footer: context {
      set text(size: 8pt, fill: grisc)
      line(length: 100%, stroke: 0.4pt + grisc)
      v(2pt)
      align(center)[Page #counter(page).display("1 / 1", both: true)]
    }
  )
  set text(font: "Liberation Serif", size: 10.5pt, lang: "fr")
  set par(justify: true, leading: 0.78em, spacing: 1.1em)
}

// ── Bandeau de titre de fascicule ───────
#let titre-fascicule(num, titre, sous-titre) = {
  v(0.5cm)
  block(width: 100%, fill: bleu, inset: (x: 20pt, y: 16pt), radius: 10pt)[
    #grid(columns: (auto, 1fr), gutter: 14pt,
      align(horizon)[
        #block(fill: white.transparentize(70%), inset: (x:8pt, y:6pt), radius: 5pt)[
          #text(fill: white, weight: "bold", size: 13pt)[N°#num]
        ]
      ],
      align(horizon)[
        #text(fill: white, weight: "bold", size: 16pt)[#titre]
        #linebreak()
        #text(fill: rgb("#AED6F1"), size: 10pt)[#sous-titre]
      ]
    )
  ]
  v(0.7em)
}
