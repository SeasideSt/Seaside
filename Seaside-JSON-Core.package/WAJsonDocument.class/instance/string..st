writing
string: aString
	stream nextPut: $".
	jsonEncoder nextPutAll: aString.
	stream nextPut: $"