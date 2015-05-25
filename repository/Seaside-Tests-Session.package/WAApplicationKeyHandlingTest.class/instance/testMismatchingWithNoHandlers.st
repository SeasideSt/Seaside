tests
testMismatchingWithNoHandlers
	"There is a key in the URL and a cookie but values do not match.
	There is no handler registered at either key."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '456'.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertExpired: response