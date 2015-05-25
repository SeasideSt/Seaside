private
trimBlanksAndQuotes: aString
	| trimmed |
	trimmed := aString trimBoth.
	^ (trimmed size > 2
		and: [ trimmed first = $"
		and: [ trimmed last = $" ] ])
			ifTrue: [ trimmed copyFrom: 2 to: trimmed size - 1 ]
			ifFalse: [ trimmed ]