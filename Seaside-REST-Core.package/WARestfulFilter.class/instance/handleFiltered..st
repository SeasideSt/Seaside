processing
handleFiltered: aRequestContext
	self executeResult: (self
		routeForContext: aRequestContext
		ifAbsent: [ self noRouteFound: aRequestContext ])