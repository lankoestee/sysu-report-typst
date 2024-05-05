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
  cols: 2,
  doc,
)

= 一级标题

== 二级标题

=== 三级标题

==== 四级标题（将不会编入目录）

下面的便是正文了

对代码的字体进行了一定优化，使用monaco作为代码字体。

```python
def hello():
    print("Hello, world!")
```

可以实现简单的*中文粗体*和*English Bold*以及_English Italic_。

其他与正常的Typst语法是一致的。