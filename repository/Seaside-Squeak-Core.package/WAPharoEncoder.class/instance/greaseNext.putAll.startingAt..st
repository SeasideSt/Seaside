accessing
greaseNext: anInteger putAll: aCollection startingAt: startIndex
	(aCollection isString and: [ aCollection isByteString ])
		ifTrue: [ self greaseNext: anInteger putAllFast: aCollection startingAt: startIndex ]
		ifFalse: [ delegate greaseNext: anInteger putAll: aCollection startingAt: startIndex ]