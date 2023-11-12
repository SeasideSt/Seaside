streaming
nextChunk: anInteger put: data
	"Write a chunk of data to the external stream. Does NOT write if no data is provided since this would logically end the chunked transfer. To end data transfer use #close instead. Raise an error if the response has been committed and closed."

	data isEmpty ifTrue: [ ^ self ].
	closed ifTrue: [ self error: 'Response is closed' ].

	"Per specification, write the length of the chunk as hexadecimal number.
	See https://httpwg.org/specs/rfc7230.html#chunked.encoding"
	externalStream
		nextPutAll: (anInteger printStringBase: 16) asByteArray;
		"crlf"
		nextPut: 13;
		nextPut: 10;
		nextPutAll: data;
		"crlf"
		nextPut: 13;
		nextPut: 10;
		flush