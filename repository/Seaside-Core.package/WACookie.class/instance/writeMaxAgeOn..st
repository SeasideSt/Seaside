writing-private
writeMaxAgeOn: aStream
	maxAge isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; Max-Age="'.
	aStream print: maxAge.
	aStream nextPut: $"