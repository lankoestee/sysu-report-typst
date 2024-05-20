#import "founder.typ": *
#show: doc => conf(
  title: "Typst测试样板",
  subtitle: "测试副标题",
  author: ("一个名字"),
  number: "一个学号",
  school: "一个学校",
  grade_major: "一个年级专业",
  report_type: "一个报告类型",
  course: "一个课程",
  teacher: "一个老师",
  cols: 1,
  doc,
)

= 一级标题

== 二级标题

=== 三级标题 <sec:1>

==== 四级标题（将不会编入目录）

下面的便是正文了

对代码的字体进行了一定优化，使用monaco作为代码字体。

```python
def hello():
    print("Hello, world!")
```

可以实现简单的*中文粗体*和*English Bold*以及_English Italic_。

#figure(
  image("figure/badge-horizonal.svg", width: 60%),
  caption: "示例图片",
  supplement: "图"
) <fig:1>

可以通过 @fig:1 来引用一个图片。

#figure(
  table(
    columns: 3,
    toprule,
    table.header(
      [Substance],
      [Subcritical °C],
      [Supercritical °C],
    ),
    midrule,
    [Hydrochloric Acid],
    [12.0], [92.1],
    [Sodium Myreth Sulfate],
    [16.6], [104],
    [Potassium Hydroxide],
    table.cell(colspan: 2)[24.7],
    bottomrule,
  ),
  caption: "示例的标准三线表格",
  supplement: "表",
) <tbl:2>

可以通过 @tbl:2 来引用一个表格。并定义了如LaTeX中toprule, midrule和bottomrule的命令实现三线表的生成。

可以通过 @TypstComposePapers 来引用一个文献，并通过 @sec:1 来引用本文中的一个章节。

$ E = m c^2 $ <eq:1>

可以通过 @eq:1 来引用一个`block`的公式，这些公式都被自动编号了。

#task[
  用`#task`命令可以生成一个任务框，用于标记一些需要注意的地方。
]

#para[小段落] 通过`#para`实现LaTeX中`\paragraph{小段落}`的效果

其他与正常的Typst语法是一致的。

#bibliography("reference.bib")