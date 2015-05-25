tests
testCookiesDisabledNoFieldCookieHandlerPresent
	"Cookies are DISABLED.
	There is no key in the URL but there is a cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: nil cookieKey: key.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testNoKey."
	self assertNoCookies: response.
	self assertDefault: response