tests
testMismatchingWithUrlHandler
	"There is a key in the URL and a cookie but values do not match.
	There is a handler registered at the URL key but not at the cookie key."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	self assertCookieAddition: response key: key.
	self assertDispatched: response