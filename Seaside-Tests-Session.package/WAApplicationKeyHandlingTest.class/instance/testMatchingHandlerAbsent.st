tests
testMatchingHandlerAbsent
	"There is a key in the URL and a cookie and the values match. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	self assertCookieDeletion: response.
	self assertExpired: response