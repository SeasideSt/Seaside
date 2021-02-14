"
The purpose of WAInteractionTest is to provide a fully initialized WARequestContext all the necessary objects are are normally there in a Seaside application like request, response, dispatcher application, session and so forth.
"
Class {
	#name : #WAInteractionTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Session'
}

{ #category : #accessing }
WAInteractionTest >> application [
	^ self requestContext application
]

{ #category : #configuration }
WAInteractionTest >> createHandlers [
	| dispatcher application session root |
	root := WADispatcher new.
	dispatcher := root register: WADispatcher new at: 'rails'.
	application := dispatcher register: WAApplication new at: 'homepage'.
	session := WASession new.
	application register: session.
	^ super createHandlers, (Array with: root with: dispatcher with: application with: session)
]

{ #category : #accessing }
WAInteractionTest >> session [
	^ self requestContext session
]

{ #category : #tests }
WAInteractionTest >> testDeleteNetscapeCookie [
	| requestCookie responseCookies responseCookie |
	self application preferenceAt: #serverPath put: '/en/private_kunden/wealth_management'.
	requestCookie := WARequestCookie key: 'password' value: 'sex'.
	self requestContextWithUrl: '/' cookies: (Array with: requestCookie).
	self requestContext response deleteCookie: requestCookie.
	
	responseCookies := self requestContext response cookies.
	self assert: responseCookies size = 1.
	responseCookie := responseCookies any.
	
	self assert: (responseCookie isKindOf: WACookie).
	self assert: responseCookie value = ''.
	self assert: responseCookie path = self application url pathStringUnencoded
]

{ #category : #tests }
WAInteractionTest >> testDeleteRfc2965Cookie [
	| requestCookie responseCookies responseCookie |
	requestCookie := (WARequestCookie key: 'password' value: 'sex')
		path: '/en/private_kunden/wealth_management';
		version: 1;
		yourself.
	self requestContextWithUrl: '/' cookies: (Array with: requestCookie).
	self requestContext response deleteCookie: requestCookie.
	
	responseCookies := self requestContext response cookies.
	self assert: responseCookies size = 1.
	responseCookie := responseCookies any.
	
	self assert: (responseCookie isKindOf: WACookie).
	self assert: responseCookie value = ''.
	self assert: responseCookie path = '/en/private_kunden/wealth_management'
]

{ #category : #tests }
WAInteractionTest >> testNewCookie [
	| cookie |
	cookie := self requestContext newCookie.
	self assert: cookie path = self application url pathStringUnencoded.
	self assert: cookie ports isNil.
	self assert: cookie httpOnly.
	self deny: cookie secure.
	self assert: cookie domain isNil.
	
	self application preferenceAt: #serverPath put: '/en/private_kunden/wealth_management'.
	cookie := self requestContext newCookie.
	self assert: cookie path = '/en/private_kunden/wealth_management'.
	self assert: cookie ports isNil.
	self assert: cookie httpOnly.
	self deny: cookie secure.
	self assert: cookie domain isNil.
	
	self application preferenceAt: #serverPort put: 8080.
	self application preferenceAt: #serverProtocol put: 'https'.
	self application preferenceAt: #serverHostname put: 'www.lgt.com'.
	cookie := self requestContext newCookie.
	self assert: cookie path = '/en/private_kunden/wealth_management'.
	self deny: cookie ports isNil.
	self assert: cookie ports size = 1.
	self assert: cookie ports first = 8080.
	self assert: cookie httpOnly.
	self assert: cookie secure.
	self assert: cookie domain = 'www.lgt.com'
]
