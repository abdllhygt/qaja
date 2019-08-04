Red[
  author: "Abdullah Yiğiterol"
]

do %import.red

either empty? system/options/args [
  quit
][
  switch system/options/args/1 [
    "qq" [
      remove system/options/args
      either system/options/args/1 = "qsl" [
        remove system/options/args
        print to-qsl addspace system/options/args
      ][
        if system/options/args/1 = "id" [
          do %lex/id.red
        ]
        if system/options/args/1 = "en" [
          do %lex/en.red
        ]
        remove system/options/args
        print do to-qsl addspace system/options/args
      ];second argument
    ]; qq
    "qsl" [
      remove system/options/args
      either system/options/args/1 = "qsl" [
        remove system/options/args
        print addspace system/options/args
      ][
        if system/options/args/1 = "id" [
          do %lex/id.red
        ]
        if system/options/args/1 = "en" [
          do %lex/en.red
        ]
        remove system/options/args
        probe system/options/args
        print do addspace system/options/args
      ];second argument
    ]; qsl
  ]
]
