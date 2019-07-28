Red [
  author: "Abdullah Yiğiterol"
]

result: copy ""

vowel: charset "aeoui"
word-vowel: charset "ai"
consonant: charset "qypshkzxnmj"
char: charset "aeouiqypshkzxnmj"
number: charset "123456789"
!number: [number any [number | "0"]]

word: [consonant word-vowel consonant word-vowel]
name: [any [vowel | consonant]]
!xo: [consonant "o"]
!xe: [consonant "e"]

!ju: ["ju" space [consonant | vowel] any [consonant | vowel]]

!o: [ (oText: copy "(oa[")
  "o" opt [space copy _o [!xo | word]]
  (
    unless value? '_o [_o: ""]
    either _o = "" [
      append oText {word: "o" ])}
    ][
      append oText rejoin["word: {" _o  "}])"]
    ]
    _o: copy ""
  )
]

!ia: [ (iaText: copy "(ia[")
  opt [copy _number !number space (append iaText rejoin["number: " _number " "])]
  opt [copy _determiner  ["ni" | "nia" | "na"] space (append iaText rejoin[{determiner: "} _determiner {" }])]
  copy _word [opt !xe word opt !xo] (append iaText rejoin[{word: "} _word {" }])
  opt ["o" (append iaText rejoin[{determiner: "o" }])]
  opt ["w" (append iaText rejoin[{plural: true }])]
  opt [space copy _adjective ["he" opt word] (append iaText rejoin[{adjective: "} _adjective {" }])]
  (
    append iaText "])"
  )
]

!-e: [ (-eText: copy "(-e[")
  !ia "e" space (append -eText iaText) !ia (append -eText iaText) any ["e" space !ia (append -eText iaText)]
  (
    append -eText "])"
  )
]


to-qsl: func [sentence [string!]][
  result: copy ""
  parse sentence [
    !-e (result: copy -eText)
    | !o (result: copy oText)
    | !ia (result: copy iaText)
  ]
  print result
  return do result
]
