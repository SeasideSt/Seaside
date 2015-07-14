writing-private
writePathQuoted: aBoolean on: aStream
	pathEncoded isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; path='.
	self write: pathEncoded quoted: aBoolean on: aStream