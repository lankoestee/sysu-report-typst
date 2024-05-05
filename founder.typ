#import "@preview/cuti:0.2.1": show-cn-fakebold

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
  )
  show raw: set text(
    font: ("Monaco", "Consolas", "FZHei-B01S")
  )

  set document(
    title: title,
    author: author,
    date: auto,
  )
  set heading(numbering: "1.1")
  show heading: set block(above: 1.4em, below: 1em)

  set align(center)

  figure(
    image("figure/badge.svg", width: 60%, fit: "cover")
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
        placement: bottom
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

  counter(page).update(2)

  set align(left)
  columns(cols, doc)
}