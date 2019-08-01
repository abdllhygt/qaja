Red [
  author: "Abdullah Yiğiterol"
]

result: copy ""

vowel: charset "aeoui"
word-vowel: charset "ai"
consonant: charset "qypshkzxnmj"
char: charset "aeouiqypshkzxnmj"
juchar: charset "abcçdefgoöuüıiqyprsşthklzxnmjvwéô"
number: charset "123456789"
!number: [number any [number | "0"]]

word: [consonant word-vowel consonant word-vowel]
name: [any [vowel | consonant]]
!xo: [consonant "o"]
!xe: [consonant "e"]

!ju: ["ju" (juText: copy {(ju "})
  space copy _ju [juchar any juchar] (append juText rejoin[_ju {") }])
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

!aa: [ (aaText: copy "(aa[")
  copy _wordA [opt !xe word opt !xo] (append aaText rejoin[{word: "} _wordA {"]) }])
]

!-e: [ (-eText: copy "(-e[")
  !ia "e" space (append -eText iaText) !ia (append -eText iaText) any ["e" space !ia (append -eText iaText)]
  (
    append -eText "])"
  )
]

!u: [ (uText: copy "(u[")
  [!-e (append uText -eText)| !ia (append uText iaText) | !ju (append uText juText)]
  any [any space "," any space [!-e (append uText -eText)| !ia (append uText iaText)
    | !ju (append uText juText)]]
  space "u" space
  [!-e (append uText -eText)| !ia (append uText iaText) | !ju (append uText juText)]
  (
    append uText "])"
  )
]

!uno: [ (unoText: copy "(u[")
  [!-e (append unoText -eText)| !ia (append unoText iaText) | !ju (append unoText juText)]
  any [any space "," any space [!-e (append unoText -eText)| !ia (append unoText iaText)
    | !ju (append unoText juText)]]
  space "uno" space
  [!-e (append unoText -eText)| !ia (append unoText iaText) | !ju (append unoText juText)]
  (
    append unoText "])"
  )
]

!i: [ "i" space (iText: copy "[text: ")
  [
    !uno (append iText unoText)
    | !u (append iText uText)
    | !-e (append iText -eText)
    | !ju (append iText juText)
    | !ia (append iText iaText)
  ]
  (
    append iText "]"
  )
]

!e: [ "e" space (eText: copy "[text: ")
  [
    !uno (append eText unoText)
    | !u (append eText uText)
    | !-e (append eText -eText)
    | !ju (append eText juText)
    | !ia (append eText iaText)
  ]
  (
    append eText "]"
  )
]

!ze: ["z" !e (zeText: copy eText)]
!pe: ["p" !e (peText: copy eText)]
!ke: ["k" !e (keText: copy eText)]

!a: [ "a" space (aText: copy "[text: ")
  !aa (
    append aText aaText
    append aText " ]"
  )
]

!za: ["z" !a (zaText: copy aText)]
!pa: ["p" !a (paText: copy aText)]
!ka: ["k" !a (kaText: copy aText)]

!oa: [ (oaText: copy "(oa[")
  "o" opt [space copy _o [!xo | word]]
  (
    unless value? '_o [_o: ""]
    either _o = "" [
      append oaText {word: "o" ])}
    ][
      append oaText rejoin["word: {" _o  "}])"]
    ]
    _o: copy ""
  )
]

!o: [ (oText: copy "[text: ")
  !oa (
    append oText oaText
    append oText " ]"
  )
]

!ieoa: [ (ieoaText: copy "ieoa[ " ieoaLast: copy "[")
  [
    !i (append ieoaText iText append ieoaLast { "i" })
    | !e (append ieoaText eText append ieoaLast { "e" })
    | !ze (append ieoaText zeText append ieoaLast { "ze" })
    | !pe (append ieoaText peText append ieoaLast { "pe" })
    | !ke (append ieoaText keText append ieoaLast { "ke" })
    | !o (append ieoaText oText append ieoaLast { "o" })
    | !a (append ieoaText aText append ieoaLast { "a" })
    | !za (append ieoaText zaText append ieoaLast { "za" })
    | !pa (append ieoaText paText append ieoaLast { "pa" })
    | !ka (append ieoaText kaText append ieoaLast { "ka" })
  ]
  any [
    space
    [
      !i (append ieoaText iText append ieoaLast { "i" })
      | !e (append ieoaText eText append ieoaLast { "e" })
      | !ze (append ieoaText zeText append ieoaLast { "ze" })
      | !pe (append ieoaText peText append ieoaLast { "pe" })
      | !ke (append ieoaText keText append ieoaLast { "ke" })
      | !o (append ieoaText oText append ieoaLast { "o" })
      | !a (append ieoaText aText append ieoaLast { "a" })
      | !za (append ieoaText zaText append ieoaLast { "za" })
      | !pa (append ieoaText paText append ieoaLast { "pa" })
      | !ka (append ieoaText kaText append ieoaLast { "ka" })
    ]
  ]
  (
    append ieoaText "]"
    append ieoaLast "]"
    append ieoaText ieoaLast
  )
]

to-qsl: func [sentence [string!]][
  result: copy ""
  parse sentence [
    !ieoa (result: copy ieoaText)
    | !uno (result: copy unoText)
    | !u (result: copy uText)
    | !-e (result: copy -eText)
    | !ju (result: copy juText)
    | !oa (result: copy oText)
    | !ia (result: copy iaText)
  ]
  print ["^[[35mqsl==" result]
  prin "^[[36mid== ^[[33m"
  return do result
]
