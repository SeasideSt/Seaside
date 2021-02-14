"
I track sessions using cookies and everything else using query fields. This works fine as long as the client accepts cookies. This breaks for web crawlers (they don't accept cookies).
"
Class {
	#name : #WACookieOnlySessionTrackingStrategy,
	#superclass : #WACookieSessionTrackingStrategy,
	#category : 'Seaside-Session'
}

{ #category : #testing }
WACookieOnlySessionTrackingStrategy class >> isAbstract [
	^ self name = #WACookieHandlerTrackingStragety
]

{ #category : #public }
WACookieOnlySessionTrackingStrategy >> addKey: aString toUrl: aUrl [
	"We never add a session key to the URL, the user agent has to support cookies"
]

{ #category : #public }
WACookieOnlySessionTrackingStrategy >> noHandlerFoundForKey: aString in: anApplication context: aRequestContext [
	| queryField |
	queryField := self queryFieldKeyFromContext: aRequestContext.
	aString = queryField ifFalse: [
		"Don't delete the session cookie if we have an expired document halder.
		Only delete the session cookie if we actually have an expired session."
		self deleteSessionCookieOf: anApplication from: aRequestContext ].
	super noHandlerFoundForKey: aString in: anApplication context: aRequestContext
]
