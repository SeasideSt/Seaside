writing
string: aString
	stream nextPut: $".
	javascriptEncoder nextPutAll: aString.
	stream nextPut: $"