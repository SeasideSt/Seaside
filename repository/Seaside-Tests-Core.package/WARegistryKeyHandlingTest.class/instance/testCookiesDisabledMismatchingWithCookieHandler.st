tests
testCookiesDisabledMismatchingWithCookieHandler
	"Cookies are DISABLED.
	There is a key in the URL and a cookie but values do not match.
	There is no handler registered at the URL key but there is one at the cookie key."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: '123' cookieKey: key.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testCookiesDisabledFieldNoCookieHandlerAbsent."
	self assertNoCookies: response.
	self assertExpired: response