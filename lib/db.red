Red [
  author: "Abdullah Yiğiterol"
  title: "Translate Words Lib"
]

dbroad: %../../db/

db: context [

  translate: func [lang1 lang2 word /road1 road2 words1 words2 result num][
    road1: rejoin [dbroad lang1 "/"]
    road2: rejoin [dbroad lang2 "/"]
    words1: do rejoin [road1 "i"]
    either include? word words1 [
      words2: do rejoin [road2 "i"]
      num: findnum word words1
      result: words2/(num)
    ][
      words1: do rejoin [road1 "me"]
      either include? word words1 [
        words2: do rejoin [road2 "me"]
        num: findnum word words1
        result: words2/(num)
      ][
        words1: do rejoin [road1 "he"]
        words2: do rejoin [road2 "he"]
        num: findnum word words1
        result: words2/(num)
      ]
    ]
    return result
  ];translate
  translate-o: func [lang1 lang2 word][
    road1: rejoin [dbroad lang1 "/o"]
    road2: rejoin [dbroad lang2 "/o"]
    words1: do road1
    either include? word words1 [
      words2: do road2
      num: findnum word words1
      result: words2/(num)
    ][
      result: words
    ]
    return result
  ]
  translate-a: func [lang1 lang2 word][
    road1: rejoin [dbroad lang1 "/a"]
    road2: rejoin [dbroad lang2 "/a"]
    words1: do road1
    either include? word words1 [
      words2: do road2
      num: findnum word words1
      result: words2/(num)
    ][
      result: words
    ]
    return result
  ]
]
