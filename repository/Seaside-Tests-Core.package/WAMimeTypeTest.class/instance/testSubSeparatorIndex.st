tests
testSubSeparatorIndex
	"Test the index of the '+' separator in subtypes"
	
	"Simple subtype without separator"
	self assert: (WAMimeType fromString: 'application/json') subSeparatorIndex equals: 0.
	
	"Subtype with '+' separator"
	self assert: (WAMimeType fromString: 'application/ld+json') subSeparatorIndex equals: 3.
	self assert: (WAMimeType fromString: 'application/vnd.api+json') subSeparatorIndex equals: 8.
	
	"Multiple '+' separators - should return last one"
	self assert: (WAMimeType fromString: 'application/foo+bar+json') subSeparatorIndex equals: 8