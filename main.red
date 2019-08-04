Red[
  author: "Abdullah Yiğiterol"
]

do %import.red

either empty? system/options/args [
  quit
][
  remove system/options/args
  either system/options/args/1 = "qsl" [
    print to-qsl to-string system/options/args
  ][
    if system/options/args/1 = "id" [
      do %lex/id.red
    ] if system/options/args/1 = "en" [
      do %lex/en.red
    ]
    print do to-qsl to-string system/options/args
  ]
]
