writing-private
writeKeyValueQuoted: aBoolean on: aStream
	aStream nextPutAll: self key.
	aStream nextPut: $=.
	self
		write: (self value ifNil: [ '' ])
		quoted: aBoolean
		on: aStream