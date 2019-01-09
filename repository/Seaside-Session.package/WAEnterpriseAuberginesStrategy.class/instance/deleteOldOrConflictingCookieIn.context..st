private
deleteOldOrConflictingCookieIn: anApplication context: aRequestContext
	| cookie queryFieldKey |
	cookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
	queryFieldKey := self queryFieldKeyFromContext: aRequestContext.
	(cookie notNil and: [ queryFieldKey isNil or: [ cookie value = queryFieldKey ] ]) ifTrue: [
		"A query field was used for the look up but there is also a cookie with the same value -> delete it"
		self deleteSessionCookieOf: anApplication from: aRequestContext ]