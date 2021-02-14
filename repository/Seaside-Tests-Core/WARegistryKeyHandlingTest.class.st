Class {
	#name : #WARegistryKeyHandlingTest,
	#superclass : #TestCase,
	#instVars : [
		'registry',
		'registrySize'
	],
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #private }
WARegistryKeyHandlingTest >> assertCookieAddition: aResponse [
	| cookie |
	self assert: aResponse cookies size = 1.
	cookie := aResponse cookies first.
	self assert: cookie path = self path.
	self assert: cookie key = self cookieKey.
	self assert: cookie discard
]

{ #category : #private }
WARegistryKeyHandlingTest >> assertCookieAddition: aResponse key: aString [
	self assertCookieAddition: aResponse.
	self assert: aResponse cookies first value = aString
]

{ #category : #private }
WARegistryKeyHandlingTest >> assertCookieDeletion: aResponse [
	| cookie |
	self assert: aResponse cookies size = 1.
	cookie := aResponse cookies first.
	self assert: cookie path = self path.
	self assert: cookie key = self cookieKey.
	self assert: cookie expiry < (DateAndTime now - (Duration days: 1 hours: 0 minutes: 0 seconds: 0)).
	self deny: cookie discard
]

{ #category : #private }
WARegistryKeyHandlingTest >> assertDefault: aResponse [
	self assert: registry cache size = registrySize.
	self assert: aResponse status = 404
]

{ #category : #private }
WARegistryKeyHandlingTest >> assertDispatched: aResponse [
	self assert: registry cache size = registrySize.
	self assert: aResponse status = 200
]

{ #category : #private }
WARegistryKeyHandlingTest >> assertExpired: aResponse [
	self assert: registry cache size = registrySize.
	self assert: aResponse status = 302.
	self assert: (aResponse headers at: 'Location') greaseString = self path
]

{ #category : #private }
WARegistryKeyHandlingTest >> assertNoCookies: aResponse [
	self assert: aResponse cookies isEmpty
]

{ #category : #private }
WARegistryKeyHandlingTest >> cookieKey [
	^ self fieldName
]

{ #category : #private }
WARegistryKeyHandlingTest >> createRegistry [
	^ WADispatcher new
		register: (WARedirectingRegistry new
			cache: WABidirectionalCache new;
			yourself)
		at: self registryName
]

{ #category : #private }
WARegistryKeyHandlingTest >> createRegistryWithCookiesEnabled [
	"We have an instance variable named 'registry' and GemStone does not like 
		method temps to have the same name as instance variables."
	| newRegistry |
	newRegistry := self createRegistry.
	newRegistry configuration at: #trackingStrategy put: WACookieIfSupportedSessionTrackingStrategy new.
	^ newRegistry
]

{ #category : #private }
WARegistryKeyHandlingTest >> createRequestContextWithFieldKey: fieldString cookieKey: cookieString [
	| fields cookies request |
	fields := WARequestFields new.
	fieldString isNil ifFalse: [ fields at: self fieldName put: fieldString ].
	cookies := OrderedCollection new.
	cookieString isNil ifFalse: [
		| cookie |
		cookie := (WARequestCookie key: self cookieKey value: cookieString)
			pathUnencoded: self path encoded: self path;
			yourself.
		cookies add: cookie ].
	request := (WARequest method: 'GET' uri: self path)
		setPostFields: fields;
		setCookies: cookies;
		yourself.
	^ WARequestContext request: request response: WABufferedResponse new
]

{ #category : #private }
WARegistryKeyHandlingTest >> dispatch: aRequestContext to: aRegistry [
	registrySize := aRegistry cache size.
	self assert: aRequestContext consumer next = self registryName.
	[ aRegistry handle: aRequestContext ]
		on: WAResponseNotification
		do: [ :n | ].
		
	^ aRequestContext response
]

{ #category : #private }
WARegistryKeyHandlingTest >> fieldName [
	^ '_s'
]

{ #category : #private }
WARegistryKeyHandlingTest >> path [
	^ '/', self registryName
]

{ #category : #private }
WARegistryKeyHandlingTest >> registerNewHandler [
	^ registry register: WATestNoopRequestHandler new
]

{ #category : #private }
WARegistryKeyHandlingTest >> registryName [
	^ 'test'
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledFieldNoCookieHandlerAbsent [
	"Cookies are DISABLED.
	There is a key in the URL, no cookie, but handler specified by key does not exist"
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: '123' cookieKey: nil.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testFieldNoCookieHandlerAbsent"
	self assertNoCookies: response.
	self assertExpired: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledFieldNoCookieHandlerPresent [
	"Cookies are DISABLED.
	There is a key in the URL but no cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertDispatched: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledMatchingHandlerAbsent [
	"Cookies are DISABLED.
	There is a key in the URL and a cookie and the values match. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testFieldNoCookieHandlerAbsent."
	self assertNoCookies: response.
	self assertExpired: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledMatchingHandlerPresent [
	"Cookies are DISABLED.
	There is a key in the URL and a cookie and the values match. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: key.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testFieldNoCookieHandlerPresent."
	self assertNoCookies: response.
	self assertDispatched: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledMismatchingWithBothHandlers [
	"Cookies are DISABLED.
	There is a key in the URL and a cookie but values do not match.
	Both keys have registered handlers associated with them."
	
	| response context urlKey cookieKey |
	registry := self createRegistry.
	urlKey := self registerNewHandler.
	cookieKey := self registerNewHandler.
	context := self createRequestContextWithFieldKey: urlKey cookieKey: cookieKey.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testCookiesDisabledFieldNoCookieHandlerPresent."
	self assertNoCookies: response.
	self assertDispatched: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledMismatchingWithCookieHandler [
	"Cookies are DISABLED.
	There is a key in the URL and a cookie but values do not match.
	There is no handler registered at the URL key but there is one at the cookie key."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: '123' cookieKey: key.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testCookiesDisabledFieldNoCookieHandlerAbsent."
	self assertNoCookies: response.
	self assertExpired: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledMismatchingWithNoHandlers [
	"Cookies are DISABLED.
	There is a key in the URL and a cookie but values do not match.
	There is no handler registered at either key."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: '123' cookieKey: '456'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testCookiesDisabledFieldNoCookieHandlerAbsent."
	self assertNoCookies: response.
	self assertExpired: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledMismatchingWithUrlHandler [
	"Cookies are DISABLED.
	There is a key in the URL and a cookie but values do not match.
	There is a handler registered at the URL key but not at the cookie key."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: key cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testCookiesDisabledFieldNoCookieHandlerPresent."
	self assertNoCookies: response.
	self assertDispatched: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledNoFieldCookieHandlerAbsent [
	"Cookies are DISABLED.
	There is no key in the URL but there is a cookie. However, the handler specified by key does not exist."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: nil cookieKey: '123'.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testNoKey."
	self assertNoCookies: response.
	self assertDefault: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledNoFieldCookieHandlerPresent [
	"Cookies are DISABLED.
	There is no key in the URL but there is a cookie. The handler specified by key exists."
	
	| response context key |
	registry := self createRegistry.
	key := self registerNewHandler.
	context := self createRequestContextWithFieldKey: nil cookieKey: key.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testNoKey."
	self assertNoCookies: response.
	self assertDefault: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testCookiesDisabledNoKey [
	"Cookies are DISABLED.
	There is no URL field and no cookie. This is a new request to the Registry."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: nil cookieKey: nil.
	response := self dispatch: context to: registry.
	
	"Behaviour should be the same as #testNoKey."
	self assertNoCookies: response.
	self assertDefault: response
]

{ #category : #tests }
WARegistryKeyHandlingTest >> testNoKey [
	"Cookies are DISABLED.
	There is no URL field and no cookie. This is a new request to the Registry."
	
	| response context |
	registry := self createRegistry.
	context := self createRequestContextWithFieldKey: nil cookieKey: nil.
	response := self dispatch: context to: registry.
	
	self assertNoCookies: response.
	self assertDefault: response
]
