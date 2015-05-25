tests
testIsFromCrawler
	| context |
	context := self requestContext.
	self crawlerUserAgents do: [ :each |
		context request headers at: 'user-agent' put: each.
		self assert: (strategy  isFromCrawler: context) ]