tests
testCookiesDisabledMismatchingWithUrlHandler
	"Cookies are DISABLED.
	There is a key in the URL and a cookie but values do not match.
	There is a handler registered at the URL key but not at the cookie key."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testCookiesDisabledFieldNoCookieHandlerPresent."
	self assertNoCookies: response.
	self assertDispatched: response