parent/child
keyFor: aRequestHandler
	^ self
		keyFor: aRequestHandler
		ifAbsent: [ WAUnregisteredHandlerError signal ]