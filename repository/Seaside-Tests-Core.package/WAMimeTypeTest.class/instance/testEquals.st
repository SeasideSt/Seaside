tests
testEquals
	| first second |
	first := WAMimeType fromString: 'text/html'.
	second := WAMimeType fromString: 'text/html'.
	
	self assert: first = second.
	self assert: first hash = second hash.
	
	second charset: 'utf-8'.
	self assert: first = second.
	self assert: first hash = second hash.
	
	first charset: 'iso-8859-1'.
	self assert: first = second.
	self assert: first hash = second hash.
	
	second := WAMimeType fromString: 'text/xml'.
	self deny: first = second