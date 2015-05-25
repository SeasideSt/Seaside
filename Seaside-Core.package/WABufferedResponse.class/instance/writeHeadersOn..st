writing
writeHeadersOn: aStream 
	self 
		headerAt: 'Content-Length'
		put: contentsStream position.
	super writeHeadersOn: aStream