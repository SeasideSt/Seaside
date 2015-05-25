tests
testFieldNoCookieHandlerAbsent
	"There is a key in the URL, no cookie, but handler specified by key does not exist"
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: '123' cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertExpired: response