rendering
renderListOn: html for: aString
	| items |
	items := Smalltalk allClasses select: [ :each | each name includesSubstring: aString caseSensitive: false ].
	html unorderedList list: (items first: (items size min: 10))