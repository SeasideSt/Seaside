writing
writeContentOn: aStream
	committed ifFalse: [ 
		aStream nextPutAll: self contents ]