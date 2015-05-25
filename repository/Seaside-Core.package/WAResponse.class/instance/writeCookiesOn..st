writing
writeCookiesOn: aStream
	cookies do: [ :each | 
		aStream nextPutAll: 'Set-Cookie: '.
		each writeOn: aStream.
		aStream crlf ]