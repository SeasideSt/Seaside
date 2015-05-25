registration
unregister: aString
	"Unregister the application aString in the default dispatcher."

	^ self unregister: aString in: self defaultDispatcher