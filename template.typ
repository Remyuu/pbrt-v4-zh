#import "@preview/i-figured:0.2.4"
// 首行所进
#set par(first-line-indent: 2em)

// 中英文替换
#let parec(en_body, cn_body) = {
  if ("LANG_OUT" not in sys.inputs) or sys.inputs.LANG_OUT == "en" {
    set heading(outlined: false)
    set par(
      justify: true,
      leading: 0.7em,
    )
    set text(lang: "en")
    en_body
  }

  if ("LANG_OUT" not in sys.inputs) or sys.inputs.LANG_OUT == "zh" {
    set heading(outlined: true)
    set par(
      justify: true,
      leading: 1em,
      first-line-indent: 2em,
    )
    set text(lang: "zh")
    cn_body
  }
}

// 中英文替换
#let ez_caption(en_body, cn_body) = {
  if ("LANG_OUT" not in sys.inputs) or sys.inputs.LANG_OUT == "en" {
    en_body
  }
  if ("LANG_OUT" not in sys.inputs) or sys.inputs.LANG_OUT == "zh" {
    cn_body
  }
}

#let translator(note) = {
  note
}


#let pbrt(it) = {
  set page(paper: "a4", margin: 0cm)

  figure(image("bookcover-4ed.jpg", width: 100%, height: 100%))

  set cite(form: "year")

  set page(paper: "a4", margin: 2.5cm)
  set heading(numbering: "1.", supplement: [Chapter])

  // heading and fig number
  show heading: i-figured.reset-counters

  show heading.where(level: 1): it => {
    pagebreak()
    it
  }
  show heading.where(level: 2): it => {
    pagebreak()
    it
  }
  set text(font: ("Libertinus Serif", "Source Han Serif SC"), size: 11pt)

  show emph: it => {
    text(font: ("Libertinus Serif", "KaiTi_GB2312"), style: "italic", it.body)
  }

  show figure: i-figured.show-figure
  show math.equation: i-figured.show-equation.with(only-labeled: true)
  show figure.where(kind: table): set figure.caption(position: top)

  set page(
    paper: "a4",
    margin: (inside: 3cm),
    binding: left,
    numbering: "1",
    header: [
      #set text(8pt)
      #smallcaps[PBRT]
      // #h(1fr) _Exercise Sheet 3_
    ],
  )

  // Display inline code in a small box
  // that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Display block code in a larger block
  // with more padding.
  // Fix
  // 1. Empty parts of a breakable blocks
  //    https://github.com/typst/typst/issues/2914#issuecomment-2423965018
  // 2. Width of Code Block -> 100%
  show raw.where(block: true): it => {
    show raw.line: it => {
      text(fill: gray)[#it.number]
      h(1em)
      it.body
    }
    [#it]
  }
  show raw.where(block: true): set block(fill: luma(230), inset: 10pt, width: 100%)

  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  // Fake Paragraph
  // 纯中文环境下，Typst的大标题下第一段不会自动缩进，添加假段落修复。
  let empty-par = par[#box()]
  let fake-par = context empty-par + v(-measure(empty-par + empty-par).height)
  show heading: it => {
    it
    fake-par
  }

  it
}