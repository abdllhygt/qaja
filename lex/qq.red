Red [
  author: "Abdullah"
]

ju: func [k][
  return rejoin["ju" k]
]

ia: func [a [block!] /adjective word][
  unless a/plural = "" or none? a/plural  [
    word: rejoin[word "w"]
  ]
  unless a/adjective = "" or none? a/adjective  [
    word: rejoin[word " " adjective]
  ]
  unless a/determiner = "" or none? a/determiner  [
    either include? a/determiner ["ni" "na" "nia"][
      [word: rejoin[word " " a/determiner]]
    ][
      word: word
    ]
  ]
  return word
]

aa: func [a [block!] /word][
  word: copy "" comment {a/word = {} or a/word = false or a/word = none}
  either not to-logic a/word [
    either a/tense [
      word: a/tense
      if a/negative [
          word: rejoin[word " no"]
      ]
      word: word: rejoin[word " " a/word]
    ][;else tense
      word: "a"
      if a/negative [
          word: rejoin[word " no"]
      ]
      word: word: rejoin[word " " a/word]
    ]
  ][;else
    either a/tense [
      word: a/tense
      if a/negative [
        word: rejoin[" no"]
      ]
    ][;else tense
      word: "a"
      if a/negative [
        word: rejoin[" no"]
      ]
    ]
  ]
  return word
]

oa: func [a [block!]][
  either a/word "o" [
    return "o"
  ][
    return rejoin["o " a/word]
  ]
]

mn: func [a [string!]][
  return a
]

-e: func [a [block!] /newblock][
  newblock: copy []
  foreach i a [
    append newblock rejoin[(do i) "e "]
  ]
  newblock: changelast (to-string newblock) ""
  return  changelast newblock ""
]

u: func [a [block!] /newblock][
  newblock: copy []
  foreach i a [
    append newblock do i
  ]
  return andlist newblock "u"
]

uno: func [a [block!] /newblock][
  newblock: copy []
  foreach i a [
    append newblock do i
  ]
  return andlist newblock "uno"
]

ieoa: func [blockgroup [block!] typegroup [block!] /sentence][; buradayım
  sentence: copy ""
  foreach t typegroup [
    switch t [
      "o" [append sentence rejoin ["o " blockgroup/1] ]
      "i" [
        either blockgroup/1/1 = "m" and blockgroup/1/2 = " " [
          append sentence rejoin ["i" blockgroup/1]
        ][
          either blockgroup/1/1 = "n" and blockgroup/1/2 = " " [
            append sentence rejoin ["i" blockgroup/1]
          ][
            append sentence rejoin ["i " blockgroup/1]
          ]
        ]
      ]
      "a" [append sentence ["a " blockgroup/1]]
      "e" [
        either blockgroup/1/1 = "m" and blockgroup/1/2 = " " [
          append sentence rejoin ["e" blockgroup/1]
        ][
          either blockgroup/1/1 = "n" and blockgroup/1/2 = " " [
            append sentence rejoin ["i" blockgroup/1]
          ][
            append sentence rejoin ["e " blockgroup/1]
          ]
        ]
      ]
    ]
  ]
  return sentence
]

zu: func [a [string!] b [string!]][
  return rejoin[a " zu " b]
]

zupa: func [a [string!] b [string!]][
  return rejoin[a " zupa " b]
]

zuka: func [a [string!] b [string!]][
  return rejoin[a " zuka " b]
]

su: func [a [string!] b [string!]][
  return rejoin[a " su " b]
]

hu: func [a [string!] b [string!]][
  return rejoin[a " hu " b]
]
