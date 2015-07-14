writing-private
writeMaxAgeQuoted: aBoolean on: aStream
	maxAge isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; Max-Age='.
	self write: self maxAge greaseString quoted: aBoolean on: aStream