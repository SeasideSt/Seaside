streaming
nextChunk: anInteger put: data
	"Write a chunk of data to the external stream. Does NOT write if no data is provided since this would logically end the chunked transfer. To end data transfer use #close instead. Raise an error if the response has been committed and closed.
	
	Unfortunately the size of the chunk is not measured in bytes but characters so we need the ability to pass in the chunk size
	see also
	http://code.google.com/p/seaside/issues/detail?id=733"

	data isEmpty ifTrue: [ ^ self ].
	closed ifTrue: [ self error: 'Response is closed' ].

	externalStream nextPutAll: (anInteger printStringBase: 16); crlf.
	externalStream nextPutAll: data; crlf; flush