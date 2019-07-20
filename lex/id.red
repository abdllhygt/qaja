Red [
  author: "Abdullah Yiğiterol"
]

ku: func [k][
  return k
]

ia: func [a [block!] /adjective word][
  word: db/translate "qq" "id" a/word
  if a/adjective [
    adjective: db/translate "qq" "id" a/adjective
    word: rejoin[word " " adjective]
  ]
  return word
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
