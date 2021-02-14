Extension { #name : #WAPharoEncoder }

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> basicNextPut: aCharacter [
	self nextPut: aCharacter
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> basicNextPutAll: anObject [
	self nextPutAll: anObject
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> greaseNext: anInteger putAll: aCollection startingAt: startIndex [
	aCollection isByteString
		ifTrue: [ self greaseNext: anInteger putAllFast: aCollection startingAt: startIndex ]
		ifFalse: [ delegate greaseNext: anInteger putAll: aCollection startingAt: startIndex ]
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> greaseNext: anInteger putAllFast: aByteString startingAt: startIndex [
	| lastIndex nextIndex |
	lastIndex := startIndex.
	nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
	(nextIndex = 0 or: [ nextIndex = (startIndex + anInteger) ]) ifTrue: [
		^ stream greaseNext: anInteger putAll: aByteString startingAt: startIndex ].
	[	
		nextIndex >= (startIndex + anInteger) ifTrue: [
			^ stream greaseNext: startIndex + anInteger - nextIndex + 1 putAll: aByteString startingAt: lastIndex ].
		nextIndex > lastIndex ifTrue: [
			stream greaseNext: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex ].
		"let the delegate do the actual encoding"
		delegate nextPut: (aByteString at: nextIndex).
		lastIndex := nextIndex + 1.
		nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
		(nextIndex = 0 or: [ nextIndex >= (startIndex + anInteger) ]) ] whileFalse.
	lastIndex >= (startIndex + anInteger) ifFalse: [
		stream greaseNext: startIndex + anInteger - lastIndex putAll: aByteString startingAt: lastIndex ]
]

{ #category : #'*seaside-pharo-core-document' }
WAPharoEncoder >> isBinary [
	^ false
]
