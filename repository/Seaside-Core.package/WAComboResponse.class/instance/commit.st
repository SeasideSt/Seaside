initialization
commit
	"Begin a partial transmission"

	self committedCheck.

	"Send the http request header and set the receiver to chunked encoding"
	self headerAt: 'Transfer-Encoding' put: 'chunked'.

	committed := true.
	self writeStatusOn: externalStream.
	self writeHeadersOn: externalStream.
	self writeCookiesOn: externalStream.
	externalStream crlf; flush