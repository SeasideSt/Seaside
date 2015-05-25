private
routeForContext: aRequestContext ifAbsent: aNiladicBlock
	^ (WAByMethodRoutes routes: self routes)
		routeForContext: aRequestContext
		consume: self shouldConsumePath
		ifAbsent: aNiladicBlock