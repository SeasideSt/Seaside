initialization
commit
	| encodingStream |
	"Begin a partial transmission"

	self committedCheck.

	"Send the http request header and set the receiver to chunked encoding"
	self headerAt: 'Transfer-Encoding' put: 'chunked'.

	committed := true.
	
	"The external stream is usually byte based. Unfortunately, the
	streams aren't compatible enough at the moment such that everything
	could be written to the external stream directly (in particular, writing of
	singel characters doesn't work). Luckily, the encoders already translate
	characters to bytes, so we only need to wrap the stream with the appropariate
	encoder. Header data is always ASCII encoded."
	encodingStream := (GRCodec forEncoding: 'ascii') encoderFor: externalStream.
	self
		writeStatusOn: encodingStream;
		writeHeadersOn: encodingStream;
		writeCookiesOn: encodingStream.
	encodingStream
		crlf;
		flush
