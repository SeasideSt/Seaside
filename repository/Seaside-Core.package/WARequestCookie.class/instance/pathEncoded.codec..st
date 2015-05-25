accessing
pathEncoded: aString codec: aCodec
	pathEncoded := aString isNil ifTrue: [ '/' ] ifFalse: [ aString ].
	path := aString isNil
		ifTrue: [ '/' ]
		ifFalse: [
			aCodec isNil
				ifTrue: [ aString ]
				ifFalse: [ ((WAUrl absolute: aString) decodedWith: aCodec) pathStringUnencoded ] ]