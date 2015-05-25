printing
javascriptContentOn: aStream
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: self operator;
		javascript: self statement