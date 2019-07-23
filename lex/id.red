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

aa: func [a [block!] /word][
  word: copy ""
  either a/word [
    word: db/translate-a "qq" "id" a/word
    switch a/tense [
      "a" [
        if a/negative [
            word: rejoin["tidak " word]
        ]
      ]
      "za" [
        word: rejoin["sedang " word]
        if a/negative [
            word: rejoin["tidak " word]
        ]
      ]
      "ka" [
        word: rejoin["akan " word]
        if a/negative [
            word: rejoin["tidak " word]
        ]
      ]
      "pa" [
        either a/negative [
          word: rejoin["belum " word]
        ][
          word: rejoin["sudah " word]
        ]
      ]
    ];tense
  ][
    switch a/tense [
      "a" [
        word: "adalah"
        if a/negative [
            word: "bukan"
        ]
      ]
      "za" [
        word: "adalah"
        if a/negative [
            word: "bukan"
        ]
      ]
      "ka" [
        word: "akan jadi"
        if a/negative [
            word: "tidak akan jadi"
        ]
      ]
      "pa" [
        word: "sudah"
        if a/negative [
            word: "belum"
        ]
      ]
    ];tense
  ]
  return word
]

oa: func [a [block!]][
  return db/translate-o "qq" "id" a/word
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
  sentence: copy ""
  if include? "o" typegroup [
    sentence: do blockgroup/(findnum "o" typegroup)/text
    sentence: rejoin [sentence ", "]
  ]
  if include? "i" typegroup [
    append sentence do blockgroup/(findnum "i" typegroup)/text
    if include? "a" typegroup [
      append sentence " "
      append sentence do blockgroup/(findnum "a" typegroup)/text
    ];if a
  ];if i
  return sentence
]
