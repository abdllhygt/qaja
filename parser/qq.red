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
  [
    copy _number !number (append iaText rejoin["number: " _number " "])
    | copy _adjective ["he" opt word] (append iaText rejoin[{adjective: "} _adjective {" }])
    | copy _word [opt !xe word opt !xo] (append iaText rejoin[{word: "} _word {" }])
      opt ["o" (append iaText rejoin[{determiner: "o" }])]
      opt ["w" (append iaText rejoin[{plural: true }])]
    | copy _determiner  ["ni" | "nia" | "na"] (append iaText rejoin[{determiner: "} _determiner {" }])
  ]
  any [
    space
    [
      copy _number !number (append iaText rejoin["number: " _number " "])
      | copy _adjective ["he" opt word] (append iaText rejoin[{adjective: "} _adjective {" }])
      | copy _word [opt !xe word opt !xo] (append iaText rejoin[{word: "} _word {" }])
        opt "o" (append iaText rejoin[{determiner: "o" }])
        opt "w" (append iaText rejoin[{plural: true }])
      | copy _determiner  ["ni" | "nia" | "na"] (append iaText rejoin[{determiner: "} _determiner {" }])
    ]
  ]
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

!u: [ (uText: copy "(u[")
  [!-e (append uText -eText)| !ia (append uText iaText)]
  any [any space "," any space [!-e (append uText -eText)| !ia (append uText iaText)]]
  space "u" space
  [!-e (append uText -eText)| !ia (append uText iaText)]
  (
    append uText "])"
  )
]

!uno: [ (unoText: copy "(u[")
  [!-e (append unoText -eText)| !ia (append unoText iaText)]
  any [any space "," any space [!-e (append unoText -eText)| !ia (append unoText iaText)]]
  space "uno" space
  [!-e (append unoText -eText)| !ia (append unoText iaText)]
  (
    append unoText "])"
  )
]


to-qsl: func [sentence [string!]][
  result: copy ""
  parse sentence [
    !uno (result: copy unoText)
    | !u (result: copy uText)
    | !-e (result: copy -eText)
    | !o (result: copy oText)
    | !ia (result: copy iaText)
  ]
  print ["^[[35mqsl==" result]
  prin "^[[36mid== ^[[33m"
  return do result
]
