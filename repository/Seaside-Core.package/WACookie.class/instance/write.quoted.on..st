writing-private
write: aString quoted: aBoolean on: aStream
	aBoolean
		ifTrue: [
			self
				write: aString
				asQuotedStringOn: aStream ]
		ifFalse: [ aStream nextPutAll: aString ]