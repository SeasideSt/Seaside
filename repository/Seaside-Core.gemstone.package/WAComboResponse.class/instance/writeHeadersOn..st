writing
writeHeadersOn: aStream
	self isChunked ifFalse: [
		self 
		headerAt: 'Content-Length'
		put: bufferedStream position ].
	super writeHeadersOn: aStream