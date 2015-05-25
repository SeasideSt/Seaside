querying
packageNamesFor: aString
	| filtered |
	filtered := self packages
		select: [ :each | each name includesSubstring: aString caseSensitive: false ].
	filtered size > 10
		ifTrue: [ filtered := filtered first: 10 ].
	^ filtered collect: [ :each | each name ]