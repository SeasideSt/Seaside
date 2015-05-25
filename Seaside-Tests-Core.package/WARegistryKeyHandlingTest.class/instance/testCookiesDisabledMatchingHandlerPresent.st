tests
testCookiesDisabledMatchingHandlerPresent
	"Cookies are DISABLED.
	There is a key in the URL and a cookie and the values match. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: key.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testFieldNoCookieHandlerPresent."
	self assertNoCookies: response.
	self assertDispatched: response