printing
javascriptContentOn: aStream
	aStream
		javascript: self owner;
		nextPut: $.;
		nextPutAll: self method.
	JSStream encodeArguments: self arguments on: aStream