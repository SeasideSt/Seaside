tests
testCookiesDisabledMismatchingWithNoHandlers
	"Cookies are DISABLED.
	There is a key in the URL and a cookie but values do not match.
	There is no handler registered at either key."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '456'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testCookiesDisabledFieldNoCookieHandlerAbsent."
	self assertNoCookies: response.
	self assertExpired: response