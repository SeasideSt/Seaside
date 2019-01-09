accessing
javascriptContentOn: aStream

	super javascriptContentOn: aStream.
	aStream 
		nextPutAll: 'else{';
		javascript: self elseStatement.
	aStream nextPut: $}