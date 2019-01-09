private
addCookieOld: aWACookie toStream: aStream

	aStream
		nextPutAll: 'Set-Cookie: ';
		nextPutAll: aWACookie key.
	aWACookie value ~~ nil
		ifTrue: [
			aStream
				nextPut: $=;
				nextPutAll: aWACookie value ].
	aWACookie 
		writeExpiresOn: aStream;
		writePathQuoted: false on: aStream;
		writeDomainQuoted: false on: aStream;
		writeSecureOn: aStream;
		writeHttpOnlyOn: aStream.
	aStream
		nextPut: Character cr;
		nextPut: Character lf.