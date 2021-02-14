"
I implement a session tracking strategy that emulates common JavaEE application servers (Tomcat, WildFly AS). I am similar to WACookieIfSupportedSessionTrackingStrategy.

I will do the following
- add a cookie named JSESSIONID
- add a path parameter named jsessionid until we see a cookie, eg. /;jsessionid=1234?_k=5678
"
Class {
	#name : #WAEnterpriseAuberginesStrategy,
	#superclass : #WACookieIfSupportedSessionTrackingStrategy,
	#category : 'Seaside-Session'
}

{ #category : #public }
WAEnterpriseAuberginesStrategy >> addKey: aString toUrl: aUrl [
	"Only add a query field if there isn't already a cookie"
	self
		cookieFromContext: self requestContext
		ifAbsent: [ self addPathParameterWithValue: aString to: aUrl ]
]

{ #category : #private }
WAEnterpriseAuberginesStrategy >> deleteOldOrConflictingCookieIn: anApplication context: aRequestContext [
	| cookie queryFieldKey |
	cookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
	queryFieldKey := self queryFieldKeyFromContext: aRequestContext.
	(cookie notNil and: [ queryFieldKey isNil or: [ cookie value = queryFieldKey ] ]) ifTrue: [
		"A query field was used for the look up but there is also a cookie with the same value -> delete it"
		self deleteSessionCookieOf: anApplication from: aRequestContext ]
]

{ #category : #private }
WAEnterpriseAuberginesStrategy >> keyCookieName [
	"Coolie is ALL CAPS"
	
	^ 'JSESSIONID'
]

{ #category : #private }
WAEnterpriseAuberginesStrategy >> keyField [
	"Parameter is lower case"
	
	^ 'jsessionid'
]

{ #category : #public }
WAEnterpriseAuberginesStrategy >> keyFromContext: aRequestContext [
	"If a query field is present it overrides a cookie."
	| key |
	key := self pathParameterKeyFromContext: aRequestContext.
	^ key isNil
		ifTrue: [ (self cookieFromContext: aRequestContext ifAbsent: [ ^ nil ]) value ]
		ifFalse: [ key ]
]

{ #category : #public }
WAEnterpriseAuberginesStrategy >> noHandlerFoundForKey: aString in: anApplication context: aRequestContext [
	self deleteOldOrConflictingCookieIn: anApplication context: aRequestContext.
	super noHandlerFoundForKey: aString in: anApplication context: aRequestContext
]
