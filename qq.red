Red [
	author: "Abdllh"
]

titles: []
script: []

spc: [some space]
aspc: [any space]

!kc: charset "qypshjkzxnm"
!kw: charset "ai"

!k4: [[!kc !kw !kc !kw] any [spc !k4]]
!k5: [[!kc !kw !kc !kw "i"] any [spc !k5]]
!k3: [[!kw !kc !kw] any [spc !k3]]

!k: [
	[
		 opt [!k3 spc] opt [!k5 spc] opt [!k3 spc]
		 !k4
		 opt [spc !k3] opt [spc !k5] opt [spc !k3]
	]
	| opt [!k5 spc] !k3 opt [spc !k5]
	| opt [!k3 spc] !k5 opt [spc !k3]
]

!he: [
	[!k spc "he" spc !k any [spc "he" !k]]
	| [!k spc "eh" spc !k any [spc "eh" !k]]
]

!qu: [
	any [!k aspc "," spc]!k spc "qu" spc !k any [spc "qu" !k]
]

!qunu: [
	any [!k aspc "," spc]!k spc "qunu" spc !k any [spc "qunu" !k]
]

!i: ["i" spc [!qunu | !qu | !he | !k]]
!e: ["e" spc [!qunu | !qu | !he | !k]]
!a: ["a" spc [!he | !k]]
!ni: ["ni" opt [spc [!k4 | !k3]]]

!kaei: [
	[
		!i (append titles  "i")
		| !e (append titles  "e")
		| !a (append titles  "a")
		| !ni (append titles  "ni")
	]
	any [
		[spc !i (append titles "i")] 
		|[spc !e (append titles "e")] 
		|[spc !a (append titles "a")] 
		|[spc !ni (append titles "ni")]
	]
]

!pu: [
	[opt [!kaei spc] "pu" (append titles "pu") spc !kaei]
	| [spc !kaei "up" (append titles "up") opt [!kaei spc]]
]

!zu: [
	[opt [!kaei spc] "zu" (append titles "zu") spc !kaei]
	| [spc !kaei "uz" (append titles "uz") opt [!kaei spc]]
]

!ku: [
	[spc !kaei "ku" (append titles "ku") opt [!kaei spc]]
]


qq-parse: func[s [string!]][
	pwork: 
	parse s [
		[
			(titles: []) !pu
			| (clear titles) !zu
			| (clear titles) !ku
			| (clear titles) !kaei
		]
		end
	]
	probe pwork
	probe titles
]

while [0 = 0][
	sentence: ask ">>"
	if sentence = "." [
		quit
	]
	qq-parse sentence
	clear titles
]
