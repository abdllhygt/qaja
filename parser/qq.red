Red [
  author: "Abdullah Yiğiterol"
]

result: copy ""

vowel: charset "aeoui"
word-vowel: charset "ai"
consonant: charset "qypshkzxnm"
char: charset "aeouiqypshkzxnm"

word: [consonant word-vowel consonant word-vowel]
!xo: [consonant "o"]
!xe: [consonant "e"]

!o: ["o" opt [space copy _o [!xo | word]] ( unless value? '_o [_o: ""]
  either _o = "" [
    result: copy {(oa[word: "o"])}
  ][
    result: copy rejoin["(oa[word: {" _o  "}])"]
  ]
  _o: copy ""
)]


to-qsl: func [sentence [string!]][
  result: copy ""
  parse sentence [
    !o
  ]
  return do result
]
