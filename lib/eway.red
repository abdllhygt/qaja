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

concat: function [
	arg1 [any-string! any-block!]
	arg2 [series! any-word! any-path! char!]
	/with
		dlm [char! string! block!]
][
	if all [any-block? arg1 not with][
		set [arg1 arg2 dlm] reduce [copy to-string first arg1 next arg1 arg2]
	]
	if not any-string? arg1 [arg1: form arg1]
	if empty? arg2 [return arg1]
	dlm: any [dlm space]
	cycle: no
	total: limit: count: cyc-count: last-counted: 0
	either any-block? arg2 [
		repeat i length? arg2 [
			k: i - total - count
			append arg1 case [
				cycle [
					k: j
					if limit > 0 [count: count + 1]
					cycle: cycle % cyc-len + 1
					cyc-dlm/:cycle
				]
				block? dlm [
					case/all [
						all [limit > 0 count = limit][
							total: total + limit - 1
							last-counted: k
							k: k + 1
							limit: count: 0
						]
						integer? dlm/:k [limit: take at dlm k]
						count < limit [count: count + 1]
					]
					case [
						block? dlm/:k [
							j: k
							cyc-dlm: dlm/:k
							cyc-len: length? cyc-dlm
							cyc-dlm/(cycle: 1)
						]
						dlm/:k [dlm/:k]
						'else [either last-counted = length? dlm [space][last dlm]]
					]
				]
				'else [dlm]
			]
			if cycle [
				case/all [
					all [limit = 0 k < length? dlm][
						nums: parse at dlm k + 1 [
							collect some [
								integer! s: [
									if (block? s/1) keep (s/-1 * length? s/1)
								| 	keep (s/-1)
								] skip
							| 	block! s: keep (length? s/-1)
							| 	skip keep (1)
							]
						]
						sum: 0
						foreach n nums [sum: sum + n]
						limit: (length? arg2) - i - sum + 1 / cyc-len
					]
					limit > 0 [
						case/all [
							cycle = cyc-len [cyc-count: cyc-count + 1]
							cyc-count = limit [
								total: total + (limit * cyc-len) - 1
								last-counted: k
								limit: count: cyc-count: 0
								cycle: no
							]
						]
					]
				]
			]
			append arg1 arg2/:i
		]
	][
		rejoin [arg1 dlm arg2]
	]
]
comment [
concat "Niccolò" "Paganini"
;== "Niccolò Paganini"
concat "Pippilotta" ["Delicatessa" "Windowshade" "Mackrelmint" "Ephraim's Daughter" "Longstocking"]
;== {Pippilotta Delicatessa Windowshade Mackrelmint Ephraim's Daughter Longstocking}
concat/with "other" [than reality based] "-"
;== "other-than-reality-based"
concat/with "behold" [-of -equal -lists][-mixing -two -sized]
;== "behold-mixing-of-two-equal-sized-lists"
concat/with <p> ["class" {"pretty"}][" " "="]
;== <p class="pretty">
concat/with concat/with %/C [Users Toomas Documents Red utils] "/" [concat red] [/ .]
;== %/C/Users/Toomas/Documents/Red/utils/concat.red
concat/with to-url 'https [github com red red search]["://" . /]
;== https://github.com/red/red/search
browse concat/with https://github.com/red/red/search [o desc q FEAT s committer-date type Commits][? = [& =]]
concat "a" [b c d e f g h i j k l m]
;== "a b c d e f g h i j k l m"
concat/with "a" [b c d e f g h i j k l m] "."
;== "a.b.c.d.e.f.g.h.i.j.k.l.m"
concat/with "a" [b c d e f g h i j k l m] "->"
;== "a->b->c->d->e->f->g->h->i->j->k->l->m"
concat/with "a" [b c d e f g h i j k l m] ["->" "->" "->" ":" ":" " "]
;== "a->b->c->d:e:f g h i j k l m"
concat/with "a" [b c d e f g h i j k l m] [3 "->" 2 "."]
;== "a->b->c->d.e.f g h i j k l m"
concat/with "a" [b c d e f g h i j k l m n] [["->" " "]]
;== "a->b c->d e->f g->h i->j k->l m->n"
concat/with "a" [b c d e f g h i j k l m n] [3 ["->" " "]]
;== "a->b c->d e->f g h i j k l m n"
concat/with "a" [b c d e f g h i j k l m n] [3 [-> " "] [= " "]]
;== "a->b c->d e->f g=h i=j k=l m=n"
concat/with "a" [b c d e f g h i j k l m n] [3 ["->" " "] 2 [= " "]]
;== "a->b c->d e->f g=h i=j k l m n"
concat/with "a" [b c d e f g h i j k l m n] [3 "->" 2 [= " "]]
;== "a->b->c->d=e f=g h i j k l m n"
concat/with "a" [b c d e f g h i j k l m n] [3 "->" 2 =]
;== "a->b->c->d=e=f g h i j k l m n"
concat/with "a" [b c d e f g h i j k l m n] [3 "->" =]
;== "a->b->c->d=e=f=g=h=i=j=k=l=m=n"
concat/with "a" [b c d e f g h i j k l m n] [3 "->" 1 =]
;== "a->b->c->d=e f g h i j k l m n"
concat/with "a" [b c d e f g h i j k l m n] [[", "] " and "]
;== "a, b, c, d, e, f, g, h, i, j, k, l, m and n"
concat [a b c d] " "
;== "a b c d"
concat [a b c d] [[", "] " and "]
;== "a, b, c and d"
]
