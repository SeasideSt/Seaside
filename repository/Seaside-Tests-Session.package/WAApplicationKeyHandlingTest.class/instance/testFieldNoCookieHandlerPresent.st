tests
testFieldNoCookieHandlerPresent
	"There is a key in the URL but no cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertCookieAddition: response key: key.
	self assertDispatched: response