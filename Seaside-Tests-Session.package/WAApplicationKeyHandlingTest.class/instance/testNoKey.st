tests
testNoKey
	"There is no URL field and no cookie. This is a new request to the Registry.
	
	Instead of returning a 404, like WARegistry does, WAApplication creates a new WASession
	and also adds the cookie."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: nil cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertCookieAddition: response.
	self assert: ((registry cache at: response cookies first value) isKindOf: WASession).
	self assertDefault: response