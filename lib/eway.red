Red [
  title: "Easy Way Lib For Easy Way"
  author: [
    "Abdullah Yiğiterol"
    "Toomas Vooglaid"
  ]
]

include?: func [a [any-type!] b [series!]][
  either series? :a [
      if not same? type? :b type? :a [a: to type? :b :a]
      not empty? intersect b a
  ][to-logic find b a]
]

changelast: func [a [string!] b][
  a: reverse a
  a/1: b
  a: reverse a
  return a
]
