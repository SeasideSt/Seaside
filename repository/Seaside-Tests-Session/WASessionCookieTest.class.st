Class {
	#name : #WASessionCookieTest,
	#superclass : #WARegistryTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #testing }
WASessionCookieTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
WASessionCookieTest >> newHandler [
	^ WARedirectingApplication new
		preferenceAt: #trackingStrategy put: WACookieIfSupportedSessionTrackingStrategy new;
		preferenceAt: #serverHostname put: 'www.seaside.st';
		yourself
]

{ #category : #running }
WASessionCookieTest >> requestWithMethod: aString [
	^ WARequest
		method: aString
		uri: '/'
]

{ #category : #tests }
WASessionCookieTest >> testDeleteSessionCookieDomain [
	| context request response cookie |
	request := self requestWithMethod: 'GET'.
	request setCookies: (Array with: (WARequestCookie key: '_s' value: 'goner')).
	response := WABufferedResponse new.
	context := WARequestContext request: request response: response.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: response status = 302. "session gone"
	self assert: response cookies size = 1.
	cookie := response cookies first.
	self assert: cookie domain = 'www.seaside.st'
]

{ #category : #tests }
WASessionCookieTest >> testNewSessionCookieDomain [
	| context request response cookie |
	request := self requestWithMethod: 'GET'.
	response := WABufferedResponse new.
	context := WARequestContext request: request response: response.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: response cookies size = 1.
	cookie := response cookies first.
	self assert: cookie domain = 'www.seaside.st'
]
