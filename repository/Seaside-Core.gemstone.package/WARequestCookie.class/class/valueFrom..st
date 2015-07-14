private
valueFrom: aString
	^ (aString includes: $=)
		ifTrue: [ self trimBlanksAndQuotes: (aString copyAfter: $=) ]