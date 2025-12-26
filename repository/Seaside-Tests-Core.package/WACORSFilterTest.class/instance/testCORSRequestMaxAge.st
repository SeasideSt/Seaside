tests
testCORSRequestMaxAge

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter maxAge: 3600.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Max-Age') equals: '3600'