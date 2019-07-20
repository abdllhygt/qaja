Red [
  author: "Abdullah Yiğiterol"
]

ku: func [k][
  return k
]

ia: func [a [block!]][
  return db/translate "qq" "id" a/word
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
  return concat newblock[[", "] " dan "]
]

uno: func [a [block!] /newblock][;dan
  newblock: copy []
  foreach i a [
    append newblock do i
  ]
  return concat newblock[[", "] " atau "]
]
