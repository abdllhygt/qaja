Red [
  title: "Türkçe Ek Kütüphanesi"
]

include %eway.red

ek: object [
  sesliharf: ["a" "e" "ı" "i" "o" "u" "ö" "ü"]
  yor: func [kelime][
    either include? last kelime sesliharf [
      either include? last kelime ["e" "i"] [
        kelime: changelast kelime "i"
        return rejoin[kelime "yor"]
      ][;e,i değilse
        either include? last kelime ["a" "ı"] [
          kelime: changelast kelime "ı"
          return rejoin[kelime "yor"]
        ][;a,ı değilse
          either include? last kelime ["o" "u"] [
            kelime: changelast kelime "u"
            return rejoin[kelime "yor"]
          ][;o,u değilse
            kelime: changelast kelime "ü"
            return rejoin[kelime "yor"]
          ]
        ]
      ]
    ][;sessiz harfse

    ]
  ]
]
