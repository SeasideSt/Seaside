setup
unregisterCorsAdaptorRegular
	corsAdaptor ifNotNil:[ corsAdaptor stop; unregister ].
	corsAdaptor := nil