tests
testNoFieldCookieHandlerPresent
	"There is no key in the URL but there is a cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: nil cookieKey: key.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertDispatched: response