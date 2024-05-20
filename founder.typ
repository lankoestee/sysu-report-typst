#import "@preview/cuti:0.2.1": show-cn-fakebold
#import "@preview/algo:0.3.3": algo, i, d, comment, code
#import "@preview/i-figured:0.2.4"

#let conf(
  title: "Typst测试样板",
  subtitle: none,
  author: ("一个名字"),
  number: none,
  school: none,
  grade_major: none,
  report_type: none,
  course: none,
  teacher: none,
  cols: 1,
  doc,
) = {
  set page(
    paper: "a4",
  )
  show: show-cn-fakebold
  set par(justify: true)
  set text(
    font: ("CMU Serif", "FZShuSong-Z01S"),
    size: 12pt,
    cjk-latin-spacing: auto,
    bottom-edge: "descender",
  )
  show raw: set text(
    font: ("Monaco", "Consolas", "FZHei-B01S")
  )
  show raw.line: it => {
    text(fill: gray)[#it.number]
    h(1em)
    it.body
  }
  show raw: block.with(
    fill: luma(240),
    inset: 1em,
    width: 100%,
  )

  set document(
    title: title,
    author: author,
    date: auto,
  )
  set heading(numbering: "1.1", supplement: none)
  show heading: set block(above: 1.4em, below: 1em)

  set align(center)

  figure(
    image("figure/badge.svg", width: 60%, fit: "cover"),
    numbering: none
  )

  text(28pt, font: "FZDaHei-B02S", title)
  v(1.2em, weak: true)
  text(20pt, font: "FZHei-B01S", subtitle)
  v(2em)

  text(16pt, grid(
    columns: (6em, 16em),
    rows: auto,
    gutter: 15pt,
    text(spacing: 2em, [学 院：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      school
    ),
    text(spacing: 2em, [年级专业：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      grade_major
    ),
    text(spacing: 2em, [课 程：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      course
    ),
    text(spacing: 2em, [指导老师：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      teacher
    ),
    text(spacing: 2em, [报告类型：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      report_type
    ),
    text(spacing: 2em, [姓 名：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      author
    ),
    text(spacing: 2em, [学 号：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      number
    ),
    text(spacing: 2em, [日 期：]),
    box(width: 16em, 
      height: 20pt, 
      stroke: (bottom: 1pt),
      datetime.today().display("[year]年[month]月[day]日")
    ),
  ))

  pagebreak()

  set math.equation(numbering: "(1)", supplement: none)

  set page(
    numbering: "1",
    header: [
    #grid(
      columns: (90pt, 1fr),
      rows: auto,
      align: (left, right),
      inset: 4pt,
      stroke: (bottom: 1pt),
      figure(
        image("figure/badge-horizonal.svg", width: 90pt),
        placement: bottom,
        numbering: none
      ),
      title,
    )],
    header-ascent: 1.5em,
    margin: (y: 1.5in),
  )

  page(margin: (x: 1in), 
    outline(
    title: text(20pt, "目录"),
    depth: 3,
    indent: auto,
  ),
  footer: [1])

  pagebreak()
  show heading.where(level: 1): set align(center)
  show heading.where(level: 1): set text(font: ("CMU Serif", "FZXiaoBiaoSong-B05S"))
  show heading.where(level: 2): set text(font: ("CMU Sans Serif", "FZHei-B01S"))
  show heading.where(level: 3): set text(font: ("CMU Sans Serif", "FZHei-B01S"))
  show heading.where(level: 4): set text(font: ("CMU Sans Serif", "FZHei-B01S"))

  show ref: it => {
    let el = it.element
    if el.func() == heading{
      set text(fill: red)
      link(it.target)[
      #numbering(
        el.numbering,
        ..counter(heading).at(el.location())
      )节
      ]
    }
    else if el.func() == figure{
      set text(fill: red)
      it
    }
    else if el.func() == table{
      set text(fill: red)
      it
    }
    else if el.func() == math.equation{
      set text(fill: red)
      link(it.target)[
      #numbering(
        el.numbering,
        ..counter(math.equation).at(el.location())
      )
      ]
    }
    else if el.func() == cite{
      set text(fill: green)
      it
    }
    else{
      it
    }
  }

  set math.mat(delim: "[")

  counter(page).update(2)

  set align(left)
  columns(cols, doc)
}

#let task(body, inset: 1em, fill: rgb("#DFDFFF")) = {
  box(width: 100%, inset: inset, fill: fill)[
    #body
  ]
}

#let para(body) = {
  text(weight: "bold")[#body]
  h(1em)
}