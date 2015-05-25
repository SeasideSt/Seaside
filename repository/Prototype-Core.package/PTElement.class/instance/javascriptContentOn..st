printing
javascriptContentOn: aStream
	aStream nextPut: $$.
	JSStream encodeArguments: (Array with: self id) on: aStream