tests
testSyntax
	"Test extraction of syntax suffix after '+' separator"
	
	"Without separator, returns full subtype"
	self assert: (WAMimeType fromString: 'application/json') syntax equals: 'json'.
	self assert: (WAMimeType fromString: 'text/plain') syntax equals: 'plain'.
	
	"With separator"
	self assert: (WAMimeType fromString: 'application/ld+json') syntax equals: 'json'.
	self assert: (WAMimeType fromString: 'application/vnd.api+json') syntax equals: 'json'.
	
	"With multiple separators, uses part after last +"
	self assert: (WAMimeType fromString: 'application/foo+bar+json') syntax equals: 'json'