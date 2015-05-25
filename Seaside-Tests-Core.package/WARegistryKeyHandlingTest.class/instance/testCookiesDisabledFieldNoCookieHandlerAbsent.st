tests
testCookiesDisabledFieldNoCookieHandlerAbsent
	"Cookies are DISABLED.
	There is a key in the URL, no cookie, but handler specified by key does not exist"
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: '123' cookieKey: nil.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testFieldNoCookieHandlerAbsent"
	self assertNoCookies: response.
	self assertExpired: response