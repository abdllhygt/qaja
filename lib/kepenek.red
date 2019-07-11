Red [
  title: "Türkçe Ek Kütüphanesi"
]

include %eway.red

ek: object [
  sesliharf: ["a" "e" "ı" "i" "o" "u" "ö" "ü"]
  yor: func [kelime /sonsesli][
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
      if kelime = "git" [kelime: "gid"]
      sonsesli: lastvowel kelime
      switch sonsesli [
        "a" "ı" [
          return rejoin [kelime "ıyor"]
        ]
        "e" "i" [
          return rejoin [kelime "iyor"]
        ]
        "o" "u" [
          return rejoin [kelime "uyor"]
        ]
        "ö" "ü" [
          return rejoin [kelime "üyor"]
        ]
      ]
    ]
  ];yor
  er: func [kelime][
    either last kelime sesliharf [
      return rejoin [kelime "r"]
    ][
      switch lastvowel kelime [
        "a" "ı" [
          return rejoin [kelime "ar"]
        ]
        "e" "i" [
          return rejoin [kelime "er"]
        ]
        "o" "u" [
          return rejoin [kelime "ur"]
        ]
        "ö" "ü" [
          return rejoin [kelime "ör"]
        ]
      ]
    ]
  ];er
];ek
