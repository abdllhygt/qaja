Red [
  author: "Abdullah Yiğiterol"
]

ku: func [k][
  return k
]

-e: func [a [block!] /aTranslated][
  aTranslated: copy []
  foreach i a [
    append aTranslated (db/translate "qq" "id" i)
  ]
  return remove rejoin [" " aTranslated]
]

u: func [a [block!] /aTranslated][;dan
  aTranslated: copy []
  foreach i a [
    append aTranslated (db/translate "qq" "id" i)
  ]
  return remove rejoin [" " aTranslated]
]
