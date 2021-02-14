Class {
	#name : #WAApplicationKeyHandlingTest,
	#superclass : #WARegistryKeyHandlingTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #testing }
WAApplicationKeyHandlingTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
WAApplicationKeyHandlingTest >> assertDefault: aResponse [
	"Instead of returning 404 on a default request as WARegistry does, WAApplication creates a new
	Session and dispatches to it."
	self assert: registry cache size = (registrySize + 1).
	self assert: aResponse status = 200.
	self assert: (aResponse contents beginsWithSubCollection: 'start:')
]

{ #category : #private }
WAApplicationKeyHandlingTest >> createRegistry [
	^ WADispatcher new
		register: (WARedirectingApplication new
			sessionClass: WATestSession;
			cache: WAUnidirectionalCache new;
			yourself)
		at: self registryName
]

{ #category : #private }
WAApplicationKeyHandlingTest >> registerNewHandler [
	^ registry register: WATestNoopSessionHandler new
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testFieldNoCookieHandlerAbsent [
	"There is a key in the URL, no cookie, but handler specified by key does not exist"
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: '123' cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertExpired: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testFieldNoCookieHandlerPresent [
	"There is a key in the URL but no cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertCookieAddition: response key: key.
	self assertDispatched: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testMatchingHandlerAbsent [
	"There is a key in the URL and a cookie and the values match. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	self assertCookieDeletion: response.
	self assertExpired: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testMatchingHandlerPresent [
	"There is a key in the URL and a cookie and the values match. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: key.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertDispatched: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testMismatchingWithBothHandlers [
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
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testMismatchingWithCookieHandler [
	"There is a key in the URL and a cookie but values do not match.
	There is no handler registered at the URL key but there is one at the cookie key."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: '123' cookieKey: key.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertExpired: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testMismatchingWithNoHandlers [
	"There is a key in the URL and a cookie but values do not match.
	There is no handler registered at either key."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '456'.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertExpired: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testMismatchingWithUrlHandler [
	"There is a key in the URL and a cookie but values do not match.
	There is a handler registered at the URL key but not at the cookie key."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	self assertCookieAddition: response key: key.
	self assertDispatched: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testNoFieldCookieHandlerAbsent [
	"There is no key in the URL but there is a cookie. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: nil cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	self assertCookieDeletion: response.
	self assertExpired: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testNoFieldCookieHandlerPresent [
	"There is no key in the URL but there is a cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistryWithCookiesEnabled.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: nil cookieKey: key.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertDispatched: response
]

{ #category : #tests }
WAApplicationKeyHandlingTest >> testNoKey [
	"There is no URL field and no cookie. This is a new request to the Registry.
	
	Instead of returning a 404, like WARegistry does, WAApplication creates a new WASession
	and also adds the cookie."
	
	| response context |
	registry := self createRegistryWithCookiesEnabled.
	context := self createRequestContextWithFieldKey: nil cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertCookieAddition: response.
	self assert: ((registry cache at: response cookies first value ifAbsent: [ nil ]) isKindOf: WASession).
	self assertDefault: response
]
