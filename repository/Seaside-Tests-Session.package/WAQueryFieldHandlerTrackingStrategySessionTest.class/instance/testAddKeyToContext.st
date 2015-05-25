tests
testAddKeyToContext
	| context |
	context := self requestContext.
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertNoCookies: context