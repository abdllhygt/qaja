Red[
  author: "Abdullah Yiğiterol"
]

do %import.red

while [true] [
  sentenceC: ask "qq>> "
  if sentenceC = "." [quit]
  prin "id== "
  print to-qsl sentenceC
]
