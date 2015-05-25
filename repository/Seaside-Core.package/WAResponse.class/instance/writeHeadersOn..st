writing
writeHeadersOn: aStream 
	headers keysAndValuesDo: [ :key :value | 
		aStream
			nextPutAll: key;
			nextPutAll: ': ';
			nextPutAll: value greaseString;
			crlf ]