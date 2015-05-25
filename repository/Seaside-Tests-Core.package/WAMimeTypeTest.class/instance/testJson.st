tests
testJson
	"regression test for
	http://code.google.com/p/seaside/issues/detail?id=759"
	self deny: (WAMimeType fromString: 'text/json') isBinary.
	self deny: (WAMimeType fromString: 'application/json') isBinary