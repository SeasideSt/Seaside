printing
javascriptContentOn: aStream
	aStream
		nextPutAll: self name;
		nextPut: $=.
	super javascriptContentOn: aStream