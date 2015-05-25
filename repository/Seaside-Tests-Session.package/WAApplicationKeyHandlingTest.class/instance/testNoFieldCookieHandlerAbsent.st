tests
testNoFieldCookieHandlerAbsent
	"There is no key in the URL but there is a cookie. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: nil cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	self assertCookieDeletion: response.
	self assertExpired: response