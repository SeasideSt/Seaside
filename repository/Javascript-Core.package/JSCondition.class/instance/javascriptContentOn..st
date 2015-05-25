printing
javascriptContentOn: aStream
	aStream
		nextPutAll: 'if(';
		javascript: self statement;
		nextPutAll: '){'.
	super javascriptContentOn: aStream.
	aStream nextPut: $}