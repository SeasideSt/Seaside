tests
testCORSRequestAllowedMethods

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter useExplicitMethods.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Methods') equals: 'GET, POST, HEAD'