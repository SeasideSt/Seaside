Class {
	#name : #WAApplicationTest,
	#superclass : #WARegistryTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #testing }
WAApplicationTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
WAApplicationTest >> newHandler [
	^ WAApplication new
]

{ #category : #running }
WAApplicationTest >> requestWithMethod: aString [
	^ WARequest
		method: aString
		uri: '/app/oneo'
]

{ #category : #tests }
WAApplicationTest >> testNotImplemented [
	| context request |
	#('OPTIONS' 'HEAD' 'PUT' 'DELETE' 'TRACE' 'CONNECT') do: [ :each |
		request := self requestWithMethod: each.
		context := WARequestContext request: request response: WABufferedResponse new.
		[ handler handle: context ]
			on: WAResponseNotification
			do: [ :notification | ].
		self assert: context response status = 501 ].
	
	#('GET' 'POST') do: [ :each |
		request := self requestWithMethod: each.
		context := WARequestContext request: request response: WABufferedResponse new.
		[ handler handle: context ]
			on: WAResponseNotification
			do: [ :notification | ].
		self assert: context response status ~= 501 ]
]

{ #category : #tests }
WAApplicationTest >> testPathConsumption [
	| context request |
	request := self requestWithMethod: 'GET'.
	context := WARequestContext request: request response: WABufferedResponse new.
	context consumer next.
	self assert: context consumer peek = 'oneo'.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: context consumer peek = 'oneo'
]

{ #category : #tests }
WAApplicationTest >> testPreFetchIsForbidden [
	| context request |

	request := self requestWithMethod: 'GET'.
	request headers at: 'x-moz' put: 'prefetch'. "turn it into a prefetch request"
	self assert: request isPrefetch.
		
	context := WARequestContext request: request response: WABufferedResponse new.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | "ignore" ].
	self assert: context response status = WAResponse statusForbidden
]

{ #category : #tests }
WAApplicationTest >> testUrlFor [
	| context request response session url |
	handler class == WARegistry "only WARegistry supports tracking generic request handlers"
		ifFalse: [ ^ self ].
	request := self requestWithMethod: 'GET'.
	request setCookies: (Array with: (WARequestCookie key: '_s' value: 'sessionid')).
	response := WABufferedResponse new.
	session := WASession new.
	
	context := WARequestContext request: request response: response.
	url := WACurrentRequestContext
		use: context
		during: [
			handler register: session.
			session url ].
	self assert: (url queryFields includesKey: '_s').
	request url addField: '_s' value: (url queryFields at: '_s').
		
	[  handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = 200.
	self assert: (response cookies isEmpty)
]
