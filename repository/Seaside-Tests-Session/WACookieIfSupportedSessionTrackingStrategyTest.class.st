Class {
	#name : #WACookieIfSupportedSessionTrackingStrategyTest,
	#superclass : #WACookieSessionTrackingStrategyTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #private }
WACookieIfSupportedSessionTrackingStrategyTest >> newStrategy [
	^ WACookieIfSupportedSessionTrackingStrategy new
]

{ #category : #tests }
WACookieIfSupportedSessionTrackingStrategyTest >> testAddKeyOfSessionToUrl [
	| context uri |
	context := self requestContext.
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/1/2?_s=The_Metaphor'
]

{ #category : #tests }
WACookieIfSupportedSessionTrackingStrategyTest >> testAddKeyOfSessionToUrlCookieAlreadyPresent [
	| context uri cookie1 |
	context := self requestContext.
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'The_Metaphor'.
	context request setCookies: (Array with: cookie1).
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/1/2'
]
