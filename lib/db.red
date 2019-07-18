Red [
  author: "Abdullah Yiğiterol"
  title: "Translate Words Lib"
]

do %eway.red

db: context [

  translate: func [lang1 lang2 word /road1 road2 result num][
    road1: rejoin [%../../db/ lang1 "/"]
    road2: rejoin [%../../db/ lang1 "/"]
    if include? word (do rejoin [road1 "i"]) [
      words2: do rejoin [road2 "i"]
      words1: do rejoin [road1 "i"]
      num: find words2 word
      result: words1/(num)
    ]
    return result
  ]

]
