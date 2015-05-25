parent/child
unregister: aRequestHandler
	handlers 
		removeKey: aRequestHandler name
		ifAbsent: [ ^ nil ].
	^ aRequestHandler unregistered