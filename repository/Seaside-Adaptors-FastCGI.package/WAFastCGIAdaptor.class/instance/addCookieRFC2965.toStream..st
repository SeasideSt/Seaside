private
addCookieRFC2965: aWACookie toStream: aStream

	aStream
		nextPutAll: 'Set-Cookie: ';
		nextPutAll: aWACookie rfc2965String;
		nextPut: Character cr;
		nextPut: Character lf.