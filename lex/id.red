Red [
  author: "Abdullah Yiğiterol"
]

ju: func [k][
  return k
]

ia: func [a [block!] /adjective word][
  word: db/translate "qq" "id" a/word
  unless a/plural = "" or none? a/plural  [
    word: rejoin[word "-" word]
  ]
  unless a/adjective = "" or none? a/adjective  [
    adjective: db/translate "qq" "id" a/adjective
    word: rejoin[word " " adjective]
  ]
  unless a/determiner = "" or none? a/determiner  [
    either include? a/determiner ["ni" "na" "nia"][
      either a/determiner = "ni" [
        word: rejoin[word " ini"]
      ][
        word: rejoin[word " itu"]
      ]
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
      switch a/tense [
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
      ];switch tense
    ][;else tense
      word: "adalah"
      if a/negative [
          word: "bukan"
      ]
    ]
  ][;else
    word: db/translate-a "qq" "id" a/word
    either a/tense [
      switch a/tense [
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
      ];switch tense
    ][;else tense
      if a/negative [
          word: rejoin["tidak " word]
      ]
    ]
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
      if include? "e" typegroup [
        append sentence " "
        append sentence do blockgroup/(findnum "e" typegroup)/text
      ];if e
      if include? "ze" typegroup [
        append sentence " di"
        append sentence do blockgroup/(findnum "ze" typegroup)/text
      ];if ze
      if include? "ke" typegroup [
        append sentence " ke"
        append sentence do blockgroup/(findnum "ke" typegroup)/text
      ];if ke
      if include? "pe" typegroup [
        append sentence " dari"
        append sentence do blockgroup/(findnum "pe" typegroup)/text
      ];if pe
    ];if a
    if include? "za" typegroup [
      append sentence " sedang "
      append sentence do blockgroup/(findnum "za" typegroup)/text
      if include? "e" typegroup [
        append sentence " "
        append sentence do blockgroup/(findnum "e" typegroup)/text
      ];if e
      if include? "ze" typegroup [
        append sentence " di"
        append sentence do blockgroup/(findnum "ze" typegroup)/text
      ];if ze
      if include? "ke" typegroup [
        append sentence " ke"
        append sentence do blockgroup/(findnum "ke" typegroup)/text
      ];if ke
      if include? "pe" typegroup [
        append sentence " dari"
        append sentence do blockgroup/(findnum "pe" typegroup)/text
      ];if pe
    ];if za
    if include? "pa" typegroup [
      append sentence " sudah "
      append sentence do blockgroup/(findnum "pa" typegroup)/text
      if include? "e" typegroup [
        append sentence " "
        append sentence do blockgroup/(findnum "e" typegroup)/text
      ];if e
      if include? "ze" typegroup [
        append sentence " di"
        append sentence do blockgroup/(findnum "ze" typegroup)/text
      ];if ze
      if include? "ke" typegroup [
        append sentence " ke"
        append sentence do blockgroup/(findnum "ke" typegroup)/text
      ];if ke
      if include? "pe" typegroup [
        append sentence " dari"
        append sentence do blockgroup/(findnum "pe" typegroup)/text
      ];if pe
    ];if pa
    if include? "ka" typegroup [
      append sentence " akan "
      append sentence do blockgroup/(findnum "ka" typegroup)/text
      if include? "e" typegroup [
        append sentence " "
        append sentence do blockgroup/(findnum "e" typegroup)/text
      ];if e
      if include? "ze" typegroup [
        append sentence " di"
        append sentence do blockgroup/(findnum "ze" typegroup)/text
      ];if ze
      if include? "ke" typegroup [
        append sentence " ke"
        append sentence do blockgroup/(findnum "ke" typegroup)/text
      ];if ke
      if include? "pe" typegroup [
        append sentence " dari"
        append sentence do blockgroup/(findnum "pe" typegroup)/text
      ];if pe
    ];if ka
  ];if i
  return sentence
]

zu: func [a [string!] b [string!]][
  return rejoin[a " ketika " b]
]

zupa: func [a [string!] b [string!]][
  return rejoin[a " sebelum " b]
]

zuka: func [a [string!] b [string!]][
  return rejoin[a " setelah " b]
]

su: func [a [string!] b [string!]][
  return rejoin[a " jika " b]
]

hu: func [a [string!] b [string!]][
  return rejoin[a " tentang " b]
]
