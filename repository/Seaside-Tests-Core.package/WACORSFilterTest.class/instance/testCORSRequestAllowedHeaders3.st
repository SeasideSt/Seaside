tests
testCORSRequestAllowedHeaders3

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter 
		addAllowedHeader: 'Content-Type';
		allowAllHeaders.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Headers') equals: '*'