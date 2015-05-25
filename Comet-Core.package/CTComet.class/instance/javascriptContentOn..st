printing
javascriptContentOn: aStream
	aStream
		nextPutAll: 'new Comet(';
		javascript: self url;
		nextPut: $)