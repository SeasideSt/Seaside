"
I am the abstract base class for classes that that use some request attribute that is present on every request for tracking sessions. For document handlers query fields are used.
"
Class {
	#name : #WAInvisibleSessionTrackingStrategy,
	#superclass : #WASessionTrackingStrategy,
	#category : 'Seaside-Session'
}

{ #category : #testing }
WAInvisibleSessionTrackingStrategy class >> isAbstract [
	^ self name = #WAInvisibleSessionTrackingStrategy
]

{ #category : #public }
WAInvisibleSessionTrackingStrategy >> addKey: aString toContext: aRequestContext [
	"The session id is already present, no need to add it."
]

{ #category : #public }
WAInvisibleSessionTrackingStrategy >> addKey: aString toUrl: aUrl [
	"The session id is already present, no need to add it."
]

{ #category : #public }
WAInvisibleSessionTrackingStrategy >> keyFromContext: aRequestContext [
	"If a query field is present it overrides a session id."
	| key |
	key := self queryFieldKeyFromContext: aRequestContext.
	^ key isNil
		ifTrue: [ self sessionIdFromContext: aRequestContext ]
		ifFalse: [ key ]
]

{ #category : #public }
WAInvisibleSessionTrackingStrategy >> noHandlerFoundForKey: aString in: anApplication context: aRequestContext [
	aString = (self keyFromContext: aRequestContext)
		ifTrue: [
			"expired session, create a new session"
			anApplication handleDefault: aRequestContext withKey: aString ]
		ifFalse: [
			"repired document handler, answer not found"
			super noHandlerFoundForKey: aString in: anApplication context: aRequestContext ]
]

{ #category : #private }
WAInvisibleSessionTrackingStrategy >> sessionIdFromContext: aRequestContext [
	 self subclassResponsibility
]
