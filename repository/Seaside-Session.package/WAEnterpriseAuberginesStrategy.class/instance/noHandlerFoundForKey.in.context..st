public
noHandlerFoundForKey: aString in: anApplication context: aRequestContext
	self deleteOldOrConflictingCookieIn: anApplication context: aRequestContext.
	super noHandlerFoundForKey: aString in: anApplication context: aRequestContext