examples
installInServer: znServer underPrefix: prefix
	"Install a ZnSeasideServerAdaptorDelegate in znServer under prefix,
	provided znServer contains a ZnDefaultServerDelegate instance as primary delegate.
	Note that the incoming request is destructively modified.
	Note that a global #serverPath is added to the default Seaside dispatcher."

	| seasideDelegate |
	seasideDelegate := self forServer: znServer.
	znServer delegate
		map: 'seaside'
		to: [ :request | 
			request uri removeFirstPathSegment.
			seasideDelegate handleRequest: request ].
	WAAdmin defaultDispatcher serverPath: prefix.
	^ seasideDelegate