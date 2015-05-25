tests
testCookiesDisabledNoFieldCookieHandlerAbsent
	"Cookies are DISABLED.
	There is no key in the URL but there is a cookie. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: nil cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testNoKey."
	self assertNoCookies: response.
	self assertDefault: response