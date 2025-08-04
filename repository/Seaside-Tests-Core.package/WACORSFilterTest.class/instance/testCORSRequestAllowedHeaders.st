tests
testCORSRequestAllowedHeaders

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter addAllowedHeader: 'Content-Type'.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Headers') equals: 'Content-Type'