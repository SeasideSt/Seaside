tests
testAddCookieNonePresentYet
	| context |
	context := self requestContext.
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertCookieInContext: context withValue: 'The_Metaphor'