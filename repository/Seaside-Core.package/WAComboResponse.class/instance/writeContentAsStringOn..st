writing
writeContentAsStringOn: aStream 
	committed ifFalse: [ 
		aStream nextPutAll: self contents asString ]