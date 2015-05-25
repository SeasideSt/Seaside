writing
writeOn: aStream
	self writeStatusOn: aStream.
	self writeHeadersOn: aStream.
	self writeCookiesOn: aStream.
	aStream crlf.
	self writeContentOn: aStream