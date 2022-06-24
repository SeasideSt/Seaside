writing
writeStatusOn: aStream 
"32 = ascii value for Character space"
	aStream nextPutAll: self httpVersion.
	aStream
		nextPut: 32 ;
		nextPutAll: self status greaseString.
	self message isNil ifFalse:  [
		aStream
			nextPut: 32 ;
			nextPutAll: self message ].
	aStream crlf