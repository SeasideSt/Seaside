Class {
	#name : #WACookieSessionTrackingStrategyTest,
	#superclass : #WASessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #testing }
WACookieSessionTrackingStrategyTest class >> isAbstract [
	^ self name = #WACookieSessionTrackingStrategyTest
]

{ #category : #private }
WACookieSessionTrackingStrategyTest >> assertNotFound: aRequestContext [
	self assert: aRequestContext response status = WAResponse statusFound.
	self assert: (aRequestContext response headerAt: 'Location') greaseString = '/1/2'
]

{ #category : #private }
WACookieSessionTrackingStrategyTest >> createRequest [
	^ WARequest method: 'GET' uri: '/1/2'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testAddCookieNonePresentYet [
	| context |
	context := self requestContext.
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertCookieInContext: context withValue: 'The_Metaphor'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testAddCookieOneAlreadyPresent [
	| context cookie1 |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'The_Metaphor'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertNoCookies: context
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testAddCookieOneAlreadyPresentWithWrongValue [
	| context cookie1 |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'The_Abstraction'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertCookieInContext: context withValue: 'The_Metaphor'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testEmpty [
	| key |
	key := strategy keyFromContext: self requestContext.
	self assert: key isNil
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testNoHandlerFoundForKey [
	| context notified |
	context := self requestContext.
	notified := false.
	[ strategy
		noHandlerFoundForKey: 'The_Birthday_Massacre'
		in: self newApplication
		context: context ]
		on: WAResponseNotification
		do: [ :notification | notified := true ].
	self assert: notified.
	self assertNotFound: context
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testOneOfMany [
	| cookie1 cookie2 cookie3 cookie4 actual context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	cookie2 := (WARequestCookie key: strategy keyCookieName value: 'cookie2')
		path: '/';
		yourself.
	cookie3 := (WARequestCookie key: strategy keyCookieName value: 'cookie3')
		path: '/1/2';
		yourself.
	cookie4 := (WARequestCookie key: strategy keyCookieName value: 'cookie4')
		path: '/1/2/3';
		yourself.
	context := self requestContext.
	context request setCookies: (Array
			with: cookie1
			with: cookie2
			with: cookie3
			with: cookie4).
	
	actual := strategy keyFromContext: context.
	self assert: actual = 'cookie3'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testOneOfManySlashInCookie [
	| cookie1 cookie2 cookie3 cookie4 actual context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	cookie2 := (WARequestCookie key: strategy keyCookieName value: 'cookie2')
		path: '/';
		yourself.
	cookie3 := (WARequestCookie key: strategy keyCookieName value: 'cookie3')
		path: '/1/2/';
		yourself.
	cookie4 := (WARequestCookie key: strategy keyCookieName value: 'cookie4')
		path: '/1/2/3/';
		yourself.
	context := self requestContext.
	context request setCookies: (Array
			with: cookie1
			with: cookie2
			with: cookie3
			with: cookie4).
	actual := strategy keyFromContext: context.
	self assert: actual = 'cookie3'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testOneOfManySlashInUrl [
	| cookie1 cookie2 cookie3 cookie4 actual context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	cookie2 := (WARequestCookie key: strategy keyCookieName value: 'cookie2')
		path: '/';
		yourself.
	cookie3 := (WARequestCookie key: strategy keyCookieName value: 'cookie3')
		path: '/1/2';
		yourself.
	cookie4 := (WARequestCookie key: strategy keyCookieName value: 'cookie4')
		path: '/1/2/3';
		yourself.
	context := self requestContext.
	context request setCookies: (Array
			with: cookie1
			with: cookie2
			with: cookie3
			with: cookie4).
	actual := strategy keyFromContext: context.
	self assert: actual = 'cookie3'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testOnlyOne [
	| cookie1 key context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	
	key := strategy keyFromContext: context.
	self assert: key = 'cookie1'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testQueryFieldOverridesCookie [
	| cookie1 key context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	context request uri addField: strategy keyField value: 'value1'. 
	
	key := strategy keyFromContext: context.
	self assert: key = 'value1'
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testWrongKey [
	| cookie context actual |
	cookie := WARequestCookie key: (strategy keyCookieName, '-not') value: 'cookie'.
	context := self requestContext.
	context request setCookies: (Array with: cookie).
	actual := strategy keyFromContext: context.
	self assert: actual isNil
]

{ #category : #tests }
WACookieSessionTrackingStrategyTest >> testWrongPrefix [
	| cookie1 cookie2 actual context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	cookie2 := (WARequestCookie key: strategy keyCookieName value: 'cookie2')
		path: '/one';
		yourself.

	context := self requestContext.
	context request setCookies: (Array
			with: cookie1
			with: cookie2).
	actual := strategy keyFromContext: context.
	self assert: actual = 'cookie1'
]
