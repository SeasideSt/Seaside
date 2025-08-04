tests
testCORSRequestEmpty

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	response := self responseAfter: [ application handle: request ].
	self assert: response headers isEmpty.	
