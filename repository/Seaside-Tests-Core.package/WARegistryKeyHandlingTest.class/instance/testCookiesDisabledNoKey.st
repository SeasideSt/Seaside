tests
testCookiesDisabledNoKey
	"Cookies are DISABLED.
	There is no URL field and no cookie. This is a new request to the Registry."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: nil cookieKey: nil.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testNoKey."
	self assertNoCookies: response.
	self assertDefault: response