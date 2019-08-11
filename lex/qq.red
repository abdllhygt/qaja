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
