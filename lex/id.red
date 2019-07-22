Red [
  author: "Abdullah Yiğiterol"
]

ju: func [k][
  return k
]

ia: func [a [block!] /adjective word][
  word: db/translate "qq" "id" a/word
  if a/plural [
    word: rejoin[word "-" word]
  ]
  if a/adjective [
    adjective: db/translate "qq" "id" a/adjective
    word: rejoin[word " " adjective]
  ]
  if a/determiner [
    either include? a/determiner ["ni" "na" "nia"][
      either a/determiner = "ni" [
        word: rejoin[word " ini"]
      ][
        word: rejoin[word " itu"]
      ]
    ][
      word: rejoin[a/determiner " " word]
    ]
  ]
  return word
]

mn: func [a [string!]][
  switch/default a [
    "m" [return "saya"]
    "n" [return "anda"]
    "na" [return "itu"]
    "nazo" [return "dia"]
    "naxo" [return "dia"]
    "ni" [return "ini"]
    "nia" [return "ini"]
    "kisa" [return "kita"]
    "kimi" [return "kami"]
    "kini" [return "kalian"]
    "naw" [return "mereka"]
  ][
    return "dia"
  ]
]

oa: func [a [block!]][
  return db/translate-o "qq" "id" a/word
]

-e: func [a [block!] /newblock][
  newblock: copy []
  foreach i a [
    append newblock do i
  ]
  return remove rejoin [" " newblock]
]

u: func [a [block!] /newblock][;dan
  newblock: copy []
  foreach i a [
    append newblock do i
  ]
  return andlist newblock "dan"
]

uno: func [a [block!] /newblock][;dan
  newblock: copy []
  foreach i a [
    append newblock do i
  ]
  return andlist newblock "atau"
]

ieoa: func [blockgroup [block!] typegroup [block!] /sentence][
  if include? "o" typegroup [

  ]
]
