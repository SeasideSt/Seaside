printing
javascriptContentOn: aStream
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: '=';
		javascript: self object