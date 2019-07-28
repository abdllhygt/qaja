Red [
  author: "Abdullah Yiğiterol"
]

result: copy ""

vowel: charset "aeoui"
word-vowel: charset "ai"
consonant: charset "qypshkzxnm"
char: charset "aeouiqypshkzxnm"
number: charset "123456789"
!number: [number any [number | "0"]]

word: [consonant word-vowel consonant word-vowel]
name: [any [vowel | consonant]]
!xo: [consonant "o"]
!xe: [consonant "e"]

!ju: ["ju" space [consonant | vowel] any [consonant | vowel]]

!o: ["o" opt [space copy _o [!xo | word]] ( unless value? '_o [_o: ""]
  either _o = "" [
    append result copy {(oa[word: "o"])}
  ][
    append result copy rejoin["(oa[word: {" _o  "}])"]
  ]
  _o: copy ""
)]

!ia: [
  opt [copy _number !number space]
  opt [copy _determiner  ["ni" | "nia" | "na"] space]
  copy _word [opt !xe word opt !xo]
  opt [space copy _adjective ["he" word]]
  ( unless value? '_determiner [_determiner: copy ""]
    unless value? '_adjective [_adjective: copy ""]
    unless value? '_number [_number: copy "false"]
    either _determiner = "" [_determiner: "{}"] [_determiner: rejoin[{"} _determiner {"}] ]
    either _adjective = "" [_adjective: "{}"] [_adjective: rejoin[{"} _adjective {"}] ]
    unless _number = "false" [_number: rejoin[{"} _number {"}] ]
    append result rejoin[{(ia[word: "} _word {" determiner: }
                          _determiner { adjective: } _adjective
                          ;{number: } _number
                          {])}
                        ]
    _number: copy "false"
    _determiner: copy ""
    _adjective: copy ""
  )
]


to-qsl: func [sentence [string!]][
  result: copy ""
  parse sentence [
    !o | !ia
  ]
  print result
  return do result
]
