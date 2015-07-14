writing-private
writeVersionOn: aStream
	aStream nextPutAll: '; Version='.
	aStream print: self version