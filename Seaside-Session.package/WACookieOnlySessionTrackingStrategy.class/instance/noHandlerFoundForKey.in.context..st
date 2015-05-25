public
noHandlerFoundForKey: aString in: anApplication context: aRequestContext
	| queryField |
	queryField := self queryFieldKeyFromContext: aRequestContext.
	aString = queryField ifFalse: [
		"Don't delete the session cookie if we have an expired document halder.
		Only delete the session cookie if we actually have an expired session."
		self deleteSessionCookieOf: anApplication from: aRequestContext ].
	super noHandlerFoundForKey: aString in: anApplication context: aRequestContext