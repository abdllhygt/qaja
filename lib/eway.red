Red [
  title: "Easy Way Lib For Easy Way"
  author: [
    "Abdullah Yiğiterol"
    "Toomas Vooglaid"
  ]
]

comment {include?: func [a [any-type!] b [series!] /preret ret][
  ret: false
  preret: 2
  case [
    a == "i" or a == "I" or a == "İ" [
      preret: 1
      foreach j b [
        if a == j [
          preret: 0
          break
        ]
      ]
    ]
    a == "ı" or a == "I" [
      preret: 1
      foreach j b [
        if a == j [
          preret: 0
          break
        ]
      ]
    ]
  ]
  case [
     preret > 1 [
      either series? :a [
          if not same? type? :b type? :a [a: to type? :b :a]
          ret: not empty? intersect b a
      ][ret: to-logic find b a]
    ]
    preret = 1 [
      ret: false
    ]
    preret = 0 [
      ret: true
    ]
  ]
  return ret
]
}

include?: func [a [any-type!] b [series!]][
  either block? :a [
      if not same? type? :b type? :a [a: to type? :b :a]
      not empty? intersect b a
  ][to-logic find b a]
]

findnum: func [a [any-type!] b [block!]][
  either include? a b [
    return (length? b) - (length? find b a) + 1
  ][
    return 0
  ]
]

changelast: func [a [string!] b [string!] /aCopy][
  aCopy: copy a
  aCopy: reverse aCopy
  remove aCopy
  aCopy: reverse rejoin [b aCopy]
  return aCopy
]

addspace: func [a [block!] /textA][
  textA: a/1
  remove a
  foreach j a [
    textA: rejoin [textA " " j]
  ]
  return textA
]

lastvowel: func [a [string!] /ret aCopy][
  aCopy: copy a
  either include? last aCopy "aeıiouöüéâ" [
    ret: last aCopy
  ][
    aCopy: reverse aCopy
    remove aCopy
    foreach i aCopy [
      if include? i "aeıiouöüéâ"[
        ret: i
        break
      ]
    ]
  ]
  return to string! ret
]

lastchar: func [a [string!] /aCopy][
  aCopy: copy a
  aCopy: reverse
  return to string! aCopy/1
]

andlist: func [a [block!] b [string!] /j arraysize result][
  either (length? a) = 2 [
    return rejoin [a/1 " " b " " a/2]
  ][
    arraysize: length? a
    j: 0
    result: copy ""
    foreach i a [ j: j + 1
      either j < (arraysize - 1) [
        append result rejoin[i ", "]
      ][
        either j = (arraysize - 1)[
          append result rejoin[i " " b " "]
        ][
          append result i
        ]
      ]
    ]
    return result
  ]
]
