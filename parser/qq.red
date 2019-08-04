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

!i: [
  [
    "im" (iText: copy {[text: (mn "m")}) | "in" (iText: copy {[text: (mn "n")})
    | "i na" (iText: copy {[text: (mn "na")}) | "i ni" (iText: copy {[text: (mn "ni")})
    | "i kisa" (iText: copy {[text: (mn "kisa")}) | "i kimi" (iText: copy {[text: (mn "kimi")})
    | "i kini" (iText: copy {[text: (mn "kini")}) | "i naw" (iText: copy {[text: (mn "naw")})
  ]
  (
    append iText "]"
  )
  | [ "i" space (iText: copy "[text: ")
    [
      !uno (append iText unoText)
      | !u (append iText uText)
      | !-e (append iText -eText)
      | !ju (append iText juText)
      | !ia (append iText iaText)
    ]
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

!a: [ (tenseText: copy "")
  opt [
    "z" (append tenseText { tense: "za"})
    | "p" (append tenseText { tense: "pa"})
    | "k" (append tenseText { tense: "ka"})
    | "h" (append tenseText { tense: "ha"})
  ]
  [
    "a" space (aText: copy "[text: (aa[")
    opt [ "no " (append aText {negative: true }) ]
    copy _wordA [opt !xe word opt !xo]
    (
      append aText rejoin[{ word: "} _wordA {" }]
      append aText tenseText
      append aText " ])]"
    )
    |
    "a" (
      aText: copy "[text: "
      append aText "(aa["
    ) opt [space "no" (append aText " negative: true ")]
    (
      append aText tenseText
      append aText "]) ]"
    )
  ]
]

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

!ieoa: [ (ieoaText: copy "(ieoa[ " ieoaLast: copy "[")
  [
    !i (append ieoaText iText append ieoaLast { "i" })
    | !e (append ieoaText eText append ieoaLast { "e" })
    | !ze (append ieoaText zeText append ieoaLast { "ze" })
    | !pe (append ieoaText peText append ieoaLast { "pe" })
    | !ke (append ieoaText keText append ieoaLast { "ke" })
    | !o (append ieoaText oText append ieoaLast { "o" })
    | !a (append ieoaText aText append ieoaLast { "a" })
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
    ]
  ]
  (
    append ieoaText "]"
    append ieoaLast "]"
    append ieoaText ieoaLast
    append ieoaText ")"
  )
]

!zu: [
  [  (zuText: copy "(zu ")
    !ieoa space (append zuText ieoaText) "zu" space !ieoa (append zuText ieoaText append zuText " )")
    | (zuText: copy "") !ieoa space (append zuText ieoaText) "uz" space !ieoa (insert zuText ieoaText)
    (
      insert zuText "(zu "
      append zuText " )"
    )
  ]
]

!zupa: [
  [  (zupaText: copy "(zupa ")
    !ieoa space (append zupaText ieoaText) "zupa" space !ieoa (append zupaText ieoaText append zupaText " )")
    | (zupaText: copy "") !ieoa space (append zupaText ieoaText) "uzpa" space !ieoa (insert zupaText ieoaText)
    (
      insert zupaText "(zupa "
      append zupaText " )"
    )
  ]
]

!zuka: [
  [  (zukaText: copy "(zuka ")
    !ieoa space (append zukaText ieoaText) "zuka" space !ieoa (append zukaText ieoaText append zukaText " )")
    | (zukaText: copy "") !ieoa space (append zukaText ieoaText) "uzka" space !ieoa (insert zukaText ieoaText)
    (
      insert zukaText "(zuka "
      append zukaText " )"
    )
  ]
]

!su: [
  [  (suText: copy "(su ")
    !ieoa space (append suText ieoaText) "su" space !ieoa (append suText ieoaText append suText " )")
    | (suText: copy "") !ieoa space (append suText ieoaText) "us" space !ieoa (insert suText ieoaText)
    (
      insert suText "(su "
      append suText " )"
    )
  ]
]

!hu: [
  [  (huText: copy "(hu ")
    !ieoa space (append huText ieoaText) "hu" space !ieoa (append huText ieoaText append huText " )")
    | (huText: copy "") !ieoa space (append huText ieoaText) "uh" space !ieoa (insert huText ieoaText)
    (
      insert huText "(hu "
      append huText " )"
    )
  ]
]

to-qsl: func [sentence [string!]][
  result: copy ""
  parse sentence [
    !oa (result: copy oaText) end
    | !zuka (result: copy zukaText)
    | !zupa (result: copy zupaText)
    | !su (result: copy suText)
    | !zu (result: copy zuText)
    | !hu (result: copy huText)
    | !ieoa (result: copy ieoaText)
    | !uno (result: copy unoText)
    | !u (result: copy uText)
    | !-e (result: copy -eText)
    | !ju (result: copy juText)
    | !ia (result: copy iaText)
  ]
  return result
]
