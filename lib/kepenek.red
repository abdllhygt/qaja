Red [
  title: "Türkçe Ek Kütüphanesi"
]

include %eway.red

ek: object [
  sesliharf: ["a" "e" "ı" "i" "o" "u" "ö" "ü"]
  yor: func [kelime][
    either include? last kelime sesliharf [
      either include? kelime ["ye" "de"] [
        kelime: changelast kelime "i"
        return rejoin[kelime "yor"]
      ][

      ]
    ][;sessiz harf

    ]
  ]
]
