writing
string: aString
	stream nextPut: $".
	javascriptEncoder nextPutAll: aString; flushBuffer.
	stream nextPut: $"