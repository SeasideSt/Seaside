public
noHandlerFoundForKey: aString in: anApplication context: aRequestContext
	| queryFieldKey |
	queryFieldKey := self queryFieldKeyFromContext: aRequestContext.
	queryFieldKey isNil
		ifTrue: [
			| cookie |
			"there is no query field -> a cookie was used for the look up -> delete it"
			cookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
			cookie notNil ifTrue: [
				"If there is a cookie delete it.
				Unfortunately if the browser doesn't support cookies then an expired document handler will result in the session cookie being deleted."
				self deleteSessionCookieOf: anApplication from: aRequestContext ] ]
		ifFalse: [
			| cookie |
			cookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
			(cookie notNil and: [ cookie value = queryFieldKey ]) ifTrue: [
				"A query field was used for the look up but there is also a cookie with the same value -> delete it"
				self deleteSessionCookieOf: anApplication from: aRequestContext ] ].
	super noHandlerFoundForKey: aString in: anApplication context: aRequestContext