Red[
  author: "Abdullah Yiğiterol"
]

do %import.red

while [true] [ print "^[[35m    -----------------"
  sentenceC: ask "^[[35mqq>> ^[[0m"
  if sentenceC = "." [quit]
  print to-qsl sentenceC
  prin "^[[35m"
]
