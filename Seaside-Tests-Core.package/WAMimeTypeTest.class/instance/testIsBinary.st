tests
testIsBinary
	| notBinary binary |
	notBinary := #('text/plain' 'text/bar' 'application/x-javascript' 'application/xhml+xml' 'application/xml').
	notBinary do: [ :each |
		| mimeType |
		mimeType := WAMimeType fromString: each.
		self deny: mimeType isBinary ].
	
	binary := #('application/octet-stream' 'image/jpeg').
	binary do: [ :each |
		| mimeType |
		mimeType := WAMimeType fromString: each.
		self assert: mimeType isBinary ]