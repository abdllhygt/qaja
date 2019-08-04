Red[
  author: "Abdullah Yiğiterol"
]

do %import.red
do %lex/id.red

print {
   qaja tranlation engine
  ^[[33mqisau qaja ^[[35m-> ^[[33mindonesian
}

while [true] [ print "^[[35m    -----------------"
  sentenceC: ask "^[[35mqq>> ^[[0m"
  if sentenceC = "." [quit]
  print ["^[[35mqsl==" (to-qsl sentenceC)]
  print ["^[[36mid==^[[33m" (do to-qsl sentenceC)]
  prin "^[[35m"
]
