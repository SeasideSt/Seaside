tests
testCORSRequestOriginsHeader

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter allowAnyOrigin.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Origin') equals: '*'.
	self assert: (response headers at: 'Vary') equals: nil.
	self assert: filter allowsAnyOrigin