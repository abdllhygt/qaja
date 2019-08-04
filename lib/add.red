Red [
  author: "Abdullah"
]

add: context [
  vowel: "aeoiu"

  plural: func [a [string!]][
    either include? a ["child" "man" "woman"][
      switch a [
        "child" [return "children"]
        "man" [return "men"]
        "woman" [return "women"]
      ]
    ][
      either include? a "aoiu" [
        return rejoin [a "es"]
      ][
        return rejoin [a "s"]
      ]
    ]
  ];plural

  the: func [a [string!]][
    rejoin ["the " a]
  ]

  an: func [a [string!]][
    either include? a/1 "aeoiu" [
      return rejoin ["an " a]
    ][
      return rejoin ["a " a]
    ]
  ];an

]
