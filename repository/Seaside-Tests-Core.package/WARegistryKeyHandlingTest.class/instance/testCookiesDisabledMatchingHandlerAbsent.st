tests
testCookiesDisabledMatchingHandlerAbsent
	"Cookies are DISABLED.
	There is a key in the URL and a cookie and the values match. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testFieldNoCookieHandlerAbsent."
	self assertNoCookies: response.
	self assertExpired: response