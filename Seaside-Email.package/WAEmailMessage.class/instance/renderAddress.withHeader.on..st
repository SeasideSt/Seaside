private
renderAddress: anEmailAddress withHeader: aString on: aStream 
	aStream
		nextPutAll: aString;
		nextPutAll: anEmailAddress greaseString;
		nextPut: Character cr