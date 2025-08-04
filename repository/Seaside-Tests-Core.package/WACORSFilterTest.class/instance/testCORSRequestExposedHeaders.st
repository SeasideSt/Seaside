tests
testCORSRequestExposedHeaders

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter exposedHeaders: { 'Content-Type' . 'X-Custom-Header' }.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Expose-Headers') equals: 'Content-Type, X-Custom-Header'