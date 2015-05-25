encoding
encodeKey: aKey value: aValue on: aStream 
	"Key-value pairs are common structures in JavaScript."
	
	aStream javascript: aKey greaseString; nextPut: $:; javascript: aValue