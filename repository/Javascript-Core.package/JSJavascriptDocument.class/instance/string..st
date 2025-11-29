writing
string: aString
	stream nextPut: $".
	javascripEncoder nextPutAll: aString.
	stream nextPut: $"