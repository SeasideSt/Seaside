tests
testIsNotFromCrawler
	| context |
	context := self requestContext.
	self browserUserAgents do: [ :each |
		context request headers at: 'user-agent' put: each.
		self deny: (strategy  isFromCrawler: context) ]