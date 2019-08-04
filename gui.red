Red [
  author: "Abdullah"
  needs: 'View
]

lang1: "Qisau Qaja"
lang2: "Bahasa Indonesia"

callMain: func [a [string!] b [string!] c [string!] /outtext][
  outtext: copy ""
  call/shell/output rejoin["../red ../qaja/main.red " a " " b " " c] outtext
  return outtext
]

view [ title "Qaja Translation Engine"
  drop1: drop-list "Qisau Qaja" data ["Qisau Qaja" "QSL"] [
    lang1: pick drop1/data drop1/selected
  ]
  text "" 580x20
  drop2: drop-list "Bahasa Indonesia" data ["Qisau Qaja" "Bahasa Indonesia" "QSL"] [
    lang2: pick drop2/data drop2/selected
  ]
  return return
  area1: area "" focus 204.255.204 400x200
  button "Translate" [
    either lang1 = "Qisau Qaja" [
      switch lang2 [
        "Bahasa Indonesia" [
          area2/text: callMain "qq" "id" area1/text
        ]
        "QSL" [
          area2/text: callMain "qq" "qsl" area1/text
        ]
        "Qisau Qaja" [
          area2/text: area1/text
        ]
      ]; switch lang2
    ][
      switch lang2 [
        "Bahasa Indonesia" [
          area2/text: callMain "qsl" "id" area1/text
        ]
        "QSL" [
          area2/text: area1/text
        ]
        "Qisau Qaja" [
          area2/text: "not finished!"
        ]
      ]; switch lang2
    ]
  ]
  area2: area "" disabled font-color red 400x200
  return
  text ""
]
