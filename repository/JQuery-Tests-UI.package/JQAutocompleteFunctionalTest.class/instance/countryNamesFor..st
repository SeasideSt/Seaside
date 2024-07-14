querying
countryNamesFor: aString
	| filtered |
	filtered := self countryNames
		select: [ :each | each includesSubstring: aString caseSensitive: false ].
	filtered size > 10
		ifTrue: [ filtered := filtered first: 10 ].
	^ filtered