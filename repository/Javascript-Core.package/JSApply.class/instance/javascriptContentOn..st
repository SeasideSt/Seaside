printing
javascriptContentOn: aStream
	super javascriptContentOn: aStream.
	JSStream encodeArguments: self arguments on: aStream