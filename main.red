Red[
  author: "Abdullah Yiğiterol"
]

do %import.red

while [true] [
  sentenceC: ask "qq>> "
  if sentenceC = "." [quit]
  prin "en== "
  print to-qsl sentenceC
]
