printing
javascriptContentOn: aStream
	aStream nextPut: $(.
	super javascriptContentOn: aStream.
	aStream nextPut: $?.
	aStream javascript: self trueStatement.
	aStream nextPut: $:.
	aStream javascript: self falseStatement.
	aStream nextPut: $)