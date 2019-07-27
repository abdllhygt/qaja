Red [
  author: "Abdullah Yiğiterol"
]

vowel: charset "aeoui"
word-vowel: charset "ai"
consonant: charset "qypshkzxnm"
char: charset "aeouiqypshkzxnm"

word: [consonant word-vowel consonant word-vowel]
!xo: [consonant "o"]
!xe: [consonant "e"]

!o: ["o" opt [space [!xo | word]]]


to-qsl: func [sentence [string!]][
  parse sentence [

  ]
]
