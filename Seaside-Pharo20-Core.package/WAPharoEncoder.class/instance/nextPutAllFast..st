private
nextPutAllFast: aByteString
	| lastIndex nextIndex |
	lastIndex := 1.
	nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
	nextIndex = 0 ifTrue: [ ^ stream nextPutAll: aByteString ].
	[	nextIndex > lastIndex ifTrue: [
			stream greaseNext: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex ].
		"let the delegate do the actual encoding"
		delegate nextPut: (aByteString at: nextIndex).
		lastIndex := nextIndex + 1.
		nextIndex := ByteString findFirstInString: aByteString inSet: table startingAt: lastIndex.
		nextIndex = 0 ] whileFalse.
	stream greaseNext: aByteString size - lastIndex + 1 putAll: aByteString startingAt: lastIndex.