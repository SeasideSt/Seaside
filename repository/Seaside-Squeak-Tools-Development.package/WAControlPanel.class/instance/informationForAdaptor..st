accessing
informationForAdaptor: aWAServerAdaptor

	^ String streamContents: [ :stream |
		stream 
			nextPutAll: 'Type: '; nextPutAll: aWAServerAdaptor class name; nextPut: Character cr;
			nextPutAll: 'Port: '; nextPutAll: aWAServerAdaptor port greaseString; nextPut: Character cr;
			nextPutAll: 'Encoding: '; nextPutAll: aWAServerAdaptor codec name; nextPut: Character cr.
		aWAServerAdaptor additionalStatusOn: stream.
		stream
			nextPutAll: aWAServerAdaptor statusString ]