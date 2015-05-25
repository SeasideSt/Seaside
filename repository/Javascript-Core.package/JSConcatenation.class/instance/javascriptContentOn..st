printing
javascriptContentOn: aStream
	super javascriptContentOn: aStream.
	aStream
		nextPut: $;;
		javascript: self statement