*seaside-pharo20-core-document
greaseNext: anInteger putAll: aCollection startingAt: startIndex
	aCollection isByteString
		ifTrue: [ self greaseNext: anInteger putAllFast: aCollection startingAt: startIndex ]
		ifFalse: [ delegate greaseNext: anInteger putAll: aCollection startingAt: startIndex ]