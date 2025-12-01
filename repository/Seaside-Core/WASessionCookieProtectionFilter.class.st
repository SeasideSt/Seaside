"
The session cookie protection filter ensures that the wrapped request handler only accepts requests from the same browser session. This filter is specifically useful to protect session hijacking when using the (default) query field session tracking strategy.

Because WAQueryFieldHandlerTrackingStrategy puts the Seaside session key in the url, a session can be easily hijacked by copying the url. This request filter prevents this by requiring a browser session cookie associated to the Seaside session. As a result, a copied Seaside url can only be used in the same browser session.

The use of this filter, in combination with WAQueryFieldHandlerTrackingStrategy, keeps the ability for a user to open multiple sessions of the same Seaside application in a single browser, while removing easy session hijacking. A malicious user that wants to hijack the session now needs both the url and the cookie.

The appropriate use of this filter is to add it to the session in the `initializeFilters` method of your session class. Only in this way, the session is protected from the first rendered application page onwards. See WASessionCookieProtectedSession class as an example.
"
Class {
	#name : 'WASessionCookieProtectionFilter',
	#superclass : 'WAAbstractProtectionFilter',
	#instVars : [
		'browserSessionID'
	],
	#category : 'Seaside-Core-Filter',
	#package : 'Seaside-Core',
	#tag : 'Filter'
}

{ #category : 'accessing' }
WASessionCookieProtectionFilter >> browserSessionID [
	^ browserSessionID
]

{ #category : 'constants' }
WASessionCookieProtectionFilter >> browserSessionIDCookieKey [

	^ 'seaside_browser_session'
]

{ #category : 'constants' }
WASessionCookieProtectionFilter >> browserSessionIDSize [

	^ 20
]

{ #category : 'private' }
WASessionCookieProtectionFilter >> cookieCheckUrlFor: aRequestContext [
	^ aRequestContext request url copy
			addField: self application trackingStrategy keyField value: self session key;
			addField: 'cookiecheck'; 
			yourself
]

{ #category : 'accessing' }
WASessionCookieProtectionFilter >> cookiesRequiredStatement [

	^ 'Sorry, but this application requires cookies to be enabled'
]

{ #category : 'private' }
WASessionCookieProtectionFilter >> createBrowserSessionIDCookieFor: aRequestContext [
	"Override this to customize cookie properties that fit your application needs"
	^ aRequestContext newCookie
		sameSite: 'Strict';
		key: self browserSessionIDCookieKey;
		value: self browserSessionID
]

{ #category : 'processing' }
WASessionCookieProtectionFilter >> handleFiltered: aRequestContext [
	"If the browserSessionID instvar is nil, we are a newly created session and should set our browser session id.
	Otherwise, verify the browser session id for the current request."
	self hasBrowserSessionID
		ifFalse: [ self setBrowserSessionIDFor: aRequestContext ]
		ifTrue: [ 
			(self verifyBrowserSessionIDFor: aRequestContext) ifFalse: [
				"If we carry a redirected url field, we have tried setting a cookie, which failed. Stop here to avoid infinite redirect.
				In the other case, respond with the forbidden status code"
				(self requestContext request queryFields includesKey: 'cookiecheck') 
					ifTrue: [ self respondCookiesRequired: aRequestContext ]
					ifFalse: [ aRequestContext responseGenerator forbidden; respond ] ] ].
	super handleFiltered: aRequestContext
]

{ #category : 'private' }
WASessionCookieProtectionFilter >> hasBrowserSessionID [
	^ self browserSessionID notNil
]

{ #category : 'private' }
WASessionCookieProtectionFilter >> newBrowserSessionID [
	^ WAKeyGenerator current keyOfLength: self browserSessionIDSize
]

{ #category : 'processing' }
WASessionCookieProtectionFilter >> respondCookiesRequired: aRequestContext [
	aRequestContext
		respond: [ :response | 
			response
				forbidden;
				nextPutAll: self cookiesRequiredStatement  ]
]

{ #category : 'private' }
WASessionCookieProtectionFilter >> setBrowserSessionIDFor: aRequestContext [
	"If there already is a browser session cookie, we reuse this one. 
	This means we can have multiple sessions open in a single browser, because they share the browser session id."
	(aRequestContext request cookieAt: self browserSessionIDCookieKey)
		ifNotNil: [ :cookie | browserSessionID := cookie value ]
		ifNil: [
				browserSessionID := self newBrowserSessionID.
				aRequestContext response
					addCookie: (self createBrowserSessionIDCookieFor: aRequestContext);
					redirectTo: (self cookieCheckUrlFor: aRequestContext) ]
]

{ #category : 'private' }
WASessionCookieProtectionFilter >> verifyBrowserSessionIDFor: requestContext [
	| cookie |
	cookie := requestContext request cookieAt: self browserSessionIDCookieKey.
	^ cookie notNil and: [ cookie value = self browserSessionID ]
]
