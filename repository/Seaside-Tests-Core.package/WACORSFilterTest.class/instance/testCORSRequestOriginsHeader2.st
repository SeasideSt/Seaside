tests
testCORSRequestOriginsHeader2

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter allowedOrigin: 'http://localhost:8080'.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Origin') equals: 'http://localhost:8080'.
	self assert: (response headers at: 'Vary') equals: 'Origin'.
	self deny: filter allowsAnyOrigin