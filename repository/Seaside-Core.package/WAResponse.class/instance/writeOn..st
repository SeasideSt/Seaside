writing
writeOn: aStream
	"Note: only works if the stream's collection class is a String (used for test/development purposes only"
	self writeStatusOn: aStream.
	self writeHeadersOn: aStream.
	self writeCookiesOn: aStream.
	aStream crlf.
	self writeContentAsStringOn: aStream