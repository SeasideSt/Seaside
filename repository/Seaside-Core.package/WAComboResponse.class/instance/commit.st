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
	single characters doesn't work). Luckily, the encoders already translate
	characters to bytes, so we only need to wrap the stream with the appropariate
	encoder. Header data is always ASCII encoded.
	Because older versions of Seaside don't have a dedicated ASCII encoder we
	use UTF-8 here (ASCII is a subset of UTF-8)."
	encodingStream := (GRCodec forEncoding: 'utf-8') encoderFor: externalStream.
	self
		writeStatusOn: encodingStream;
		writeHeadersOn: encodingStream;
		writeCookiesOn: encodingStream.
	encodingStream
		crlf;
		flush
