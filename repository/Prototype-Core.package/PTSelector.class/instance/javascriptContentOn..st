printing
javascriptContentOn: aStream
	aStream nextPutAll: '$$'.
	JSStream encodeArguments: self selectors on: aStream