printing
javascriptContentOn: aStream
	super javascriptContentOn: aStream.
	aStream
		nextPut: $.;
		nextPutAll: self name