writing
string: aString
	stream nextPut: $".
	javascriptStringEncoder nextPutAll: aString; flushBuffer.
	stream nextPut: $"