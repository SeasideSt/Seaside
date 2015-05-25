tests
testMatchingHandlerPresent
	"There is a key in the URL and a cookie and the values match. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: key.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertDispatched: response