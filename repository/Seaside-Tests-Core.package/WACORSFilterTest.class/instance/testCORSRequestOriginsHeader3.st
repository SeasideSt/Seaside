tests
testCORSRequestOriginsHeader3

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter denyAllOrigins.
	response := self responseAfter: [ application handle: request ].
	self assert: response headers isEmpty.
	self deny: filter allowsAnyOrigin