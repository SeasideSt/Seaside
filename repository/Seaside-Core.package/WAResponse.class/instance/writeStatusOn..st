writing
writeStatusOn: aStream 
	aStream nextPutAll: self httpVersion.
	aStream
		space;
		nextPutAll: self status greaseString.
	self message isNil ifFalse:  [
		aStream
			space;
			nextPutAll: self message ].
	aStream crlf