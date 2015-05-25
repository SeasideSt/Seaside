public
noHandlerFoundForKey: aString in: anApplication context: aRequestContext
	aString = (self keyFromContext: aRequestContext)
		ifTrue: [
			"expired session, create a new session"
			anApplication handleDefault: aRequestContext withKey: aString ]
		ifFalse: [
			"repired document handler, answer not found"
			super noHandlerFoundForKey: aString in: anApplication context: aRequestContext ]