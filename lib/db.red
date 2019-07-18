Red [
  author: "Abdullah Yiğiterol"
  title: "Translate Words Lib"
]

do %eway.red

db: context [

  translate: func [lang1 lang2 word /road1 road2 words1 words2 result num][
    road1: rejoin [%db/ lang1 "/"]
    road2: rejoin [%db/ lang2 "/"]
    words1: do rejoin [road1 "i"]
    if include? word words1 [
      words2: do rejoin [road2 "i"]
      num: findnum word words1
      result: words2/(num)
    ]
    return result
  ];translate

]
