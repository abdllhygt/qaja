Red [
  title: "Türkçe Ek Kütüphanesi"
  author: "Abdullah Yiğiterol"
]

do %eway.red

ek: context [
  sesliharf: "aeıiouöü"
  yor: func [kelime /sonsesli ret][
    either include? last kelime sesliharf [
      either include? last kelime "ei" [
        kelime: changelast kelime "i"
        ret: rejoin[kelime "yor"]
      ][;e,i değilse
        either include? last kelime "aı" [
          kelime: changelast kelime "ı"
          ret: rejoin[kelime "yor"]
        ][;a,ı değilse
          either include? last kelime "ou" [
            kelime: changelast kelime "u"
            ret: rejoin[kelime "yor"]
          ][;o,u değilse
            kelime: changelast kelime "ü"
            ret: rejoin[kelime "yor"]
          ]
        ]
      ]
    ][;sessiz harfse
      if kelime = "git" [kelime: "gid"]
      if kelime = "et" [kelime: "ed"]
      sonsesli: lastvowel kelime
      switch sonsesli [
        "a" [
          ret: rejoin [kelime "ıyor"]
        ]
        "ı" "i" [
          either sonsesli == "ı" [
            ret: rejoin [kelime "ıyor"]
          ][
            ret: rejoin [kelime "iyor"]
          ]
        ]
        "e"[
          ret: rejoin [kelime "iyor"]
        ]
        "o" "u" [
          ret: rejoin [kelime "uyor"]
        ]
        "ö" "ü" [
          ret: rejoin [kelime "üyor"]
        ]
      ]
    ]
    return ret
  ];yor
  er: func [kelime /ret][
    either include? (last kelime) sesliharf [
      ret: rejoin [kelime "r"]
    ][
      case [
        (lastvowel kelime) = "a" [
          print lastvowel kelime
          ret: rejoin [kelime "ar"]
        ]
        (lastvowel kelime) == "ı" [
          print lastvowel kelime
          ret: rejoin [kelime "ar"]
        ]
        (lastvowel kelime) == "I" [
          print lastvowel kelime
          ret: rejoin [kelime "ar"]
        ]
        include? lastvowel kelime "ei" [
          ret: rejoin [kelime "er"]
        ]
        include? lastvowel kelime "ou" [
          ret: rejoin [kelime "ur"]
        ]
        include? lastvowel kelime "öü" [
          ret: rejoin [kelime "ür"]
        ]
      ]
    ]
    return ret
  ];er
];ek
