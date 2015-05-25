tests
testMismatchingWithBothHandlers
	"There is a key in the URL and a cookie but values do not match.
	Both keys have registered handlers associated with them."
	
	| response context urlKey cookieKey |
	registry := self createRegistryWithCookiesEnabled.
	urlKey := self registerNewHandler.
	cookieKey := self registerNewHandler.
	context := self createRequestContextWithFieldKey: urlKey cookieKey: cookieKey.
	response := self dispatch: context to: registry.
	
	self assertCookieAddition: response key: urlKey.
	self assertDispatched: response