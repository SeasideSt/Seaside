tests
testCookiesDisabledFieldNoCookieHandlerPresent
	"Cookies are DISABLED.
	There is a key in the URL but no cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertDispatched: response