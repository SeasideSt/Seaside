converting
greaseString
	^ country isNil
		ifTrue: [
			"optimization, no need for allocation at all"
			language ]
		ifFalse: [
			| string stream |
			"allocate with correct size, avoid copy"
			string := String new: language size + 1 + country size.
			stream := WriteStream on: string.
			stream
				nextPutAll: language;
				nextPut: $-;
				nextPutAll: country.
			"no need for #contents because we allocated with the correct size"
			^ string ]