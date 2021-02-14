"
I am the abstract base class for tracking strategies that use cookies to track sessions and query fields to track everything else.
"
Class {
	#name : #WACookieSessionTrackingStrategy,
	#superclass : #WASessionTrackingStrategy,
	#category : 'Seaside-Session'
}

{ #category : #testing }
WACookieSessionTrackingStrategy class >> isAbstract [
	^ self name = #WACookieSessionTrackingStrategy
]

{ #category : #private }
WACookieSessionTrackingStrategy >> addCookieWithValue: aString to: aRequestContext [
	"Create a new handler key cookie and att it to the response."
	
	aRequestContext response addCookie: 
		(aRequestContext newCookie
			key: self keyCookieName;
			value: aString;
			discard: true;
			sameSite: 'Strict';
			comment: 'the Seaside Session Cookie';
			commentUrl: 'https://github.com/SeasideSt/Seaside/wiki/Session-Cookie';
			yourself)
]

{ #category : #public }
WACookieSessionTrackingStrategy >> addKey: aString toContext: aRequestContext [
	| oldCookie |
	oldCookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
	(oldCookie isNil or: [ oldCookie value ~= aString ]) ifTrue: [
		"only add the cookie if we don't already have one or it has the wrong key"
		self addCookieWithValue: aString to: aRequestContext ]
]

{ #category : #private }
WACookieSessionTrackingStrategy >> cookieFromContext: aRequestContext ifAbsent: absentBlock [
	"Answer the handler key cookie. If none is found, return the result of evaluating absentBlock.
	There can be several cookies with the correct key so we try to find the one with the most specific path."

	| candidates requestUrl |
	candidates := aRequestContext request cookiesAt: self keyCookieName.
	
	candidates isEmptyOrNil
		ifTrue: [ ^ absentBlock value ].
	candidates size = 1 
		ifTrue: [ ^ candidates first ].
		
	requestUrl := aRequestContext request url.
	candidates := candidates collect: [ :each |
		each -> (each path seasideUrl relativeTo: requestUrl) ].
	
	candidates := candidates reject: [ :each |
		| path |
		path := each value.
		path notEmpty and: [ path first = '..' ] ].

	candidates isEmpty
		ifTrue: [ ^ absentBlock value ].
		
	candidates size > 1 ifTrue: [
		candidates sort: [ :a :b |
			 a value size <= b value size ] ].
	
	^ candidates first key
]

{ #category : #private }
WACookieSessionTrackingStrategy >> deleteSessionCookieOf: anApplication from: aRequestContext [
	| cookie baseUrl |
	cookie := self cookieFromContext: aRequestContext ifAbsent: [ ^ self ].
	baseUrl := anApplication url.
	aRequestContext response 
		deleteCookie: cookie
		path:  baseUrl pathStringUnencoded
		domain: baseUrl host
]

{ #category : #private }
WACookieSessionTrackingStrategy >> keyCookieName [
	"Answer the name of the cookie to track the handler."
	
	^ self keyField
]

{ #category : #public }
WACookieSessionTrackingStrategy >> keyFromContext: aRequestContext [
	"If a query field is present it overrides a cookie."
	| key |
	key := self queryFieldKeyFromContext: aRequestContext.
	^ key isNil
		ifTrue: [ (self cookieFromContext: aRequestContext ifAbsent: [ ^ nil ]) value ]
		ifFalse: [ key ]
]
