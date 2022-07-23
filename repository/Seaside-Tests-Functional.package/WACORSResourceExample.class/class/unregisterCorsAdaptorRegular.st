setup
unregisterCorsAdaptorRegular
	CorsAdaptor ifNotNil:[ CorsAdaptor stop; unregister ].
	CorsAdaptor := nil