tests
testCORSRequestAllowCredentials2

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter allowsCredentials: false.
	response := self responseAfter: [ application handle: request ].
	self assert: response headers isEmpty