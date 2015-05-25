writing-private
writeDomainQuoted: aBoolean on: aStream
	domain isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; domain='.
	self write: self domain quoted: aBoolean on: aStream