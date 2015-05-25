writing-private
writeCommentOn: aStream
	self comment isNil
		ifTrue: [ ^ self ].
	aStream nextPutAll: '; Comment='.
	self write: self comment asQuotedStringOn: aStream