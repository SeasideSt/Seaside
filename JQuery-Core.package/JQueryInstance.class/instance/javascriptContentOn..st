printing
javascriptContentOn: aStream
	super javascriptContentOn: aStream.
	JSStream encodeArguments: arguments on: aStream