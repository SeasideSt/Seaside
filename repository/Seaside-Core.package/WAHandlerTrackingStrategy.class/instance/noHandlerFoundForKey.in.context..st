public
noHandlerFoundForKey: aString in: anApplication context: aRequestContext
	"This message is sent when no handler with the given key was found. Either there wasn't on in the first place or it was expired.
	
	The default behavior is just to let the application handle an expired handler.
	In some cases additional actions need to be performed (eg. deleting a session cookie).
	In some cases at he tracking stragety does not support generating a random handler key (eg. IP address or ssl session id based), in these cases a new session with the given key has to be created. As ususal care has to be taken that this is done only for expired sessions and not for expired document handlers."
	anApplication handleExpired: aRequestContext