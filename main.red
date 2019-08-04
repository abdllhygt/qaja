Red[
  author: "Abdullah Yiğiterol"
]

do %import.red

either empty? system/options/args [
  quit
][
  sentenceC: to-string system/options/args
  print do to-qsl sentenceC
]
