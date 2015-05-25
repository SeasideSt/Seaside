writing
writeStatusOn: aStream 
	aStream nextPutAll: self httpVersion.
	aStream
		nextPut: $ ;
		nextPutAll: self status greaseString.
	self message isNil ifFalse:  [
		aStream
			nextPut: $ ;
			nextPutAll: self message ].
	aStream crlf