public
addKey: aString toContext: aRequestContext
	| oldCookie |
	oldCookie := self cookieFromContext: aRequestContext ifAbsent: [ nil ].
	(oldCookie isNil or: [ oldCookie value ~= aString ]) ifTrue: [
		"only add the cookie if we don't already have one or it has the wrong key"
		self addCookieWithValue: aString to: aRequestContext ]