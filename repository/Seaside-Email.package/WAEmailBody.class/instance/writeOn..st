accessing
writeOn: aStream
	aStream
		nextPutAll: 'Content-Type: ';
		nextPutAll: self contentType greaseString ;
		nextPut: Character cr;
		nextPut: Character cr;
		nextPutAll: self contentString;
		nextPut: Character cr