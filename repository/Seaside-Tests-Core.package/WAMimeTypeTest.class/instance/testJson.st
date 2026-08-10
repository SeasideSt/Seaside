tests
testJson
	"Test JSON MIME type detection for both simple and structured syntax formats"
	
	"Standard JSON"
	self assert: (WAMimeType fromString: 'application/json') isJson.
	
	"Non-application types"
	self deny: (WAMimeType fromString: 'text/json') isJson.
	
	"Structured syntax with JSON suffix (RFC 6839)"
	self assert: (WAMimeType fromString: 'application/ld+json') isJson.
	self assert: (WAMimeType fromString: 'application/vnd.api+json') isJson.
	
	"Non-JSON types"
	self deny: (WAMimeType fromString: 'application/xml') isJson.
	self deny: (WAMimeType fromString: 'application/ld+xml') isJson.
	self deny: (WAMimeType fromString: 'image/json') isJson.
	
	"regression test for http://code.google.com/p/seaside/issues/detail?id=759"
	self deny: (WAMimeType fromString: 'text/json') isBinary.
	self deny: (WAMimeType fromString: 'application/json') isBinary