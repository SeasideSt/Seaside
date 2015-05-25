tests
testAddKeyToUrl
	| context uri |
	context := self requestContext.
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/catspajamassc2?_s=The_Metaphor'