instance creation
routes: aCollectionOfRoutes
	^ (self pathElementCount: aCollectionOfRoutes first pathElementCount)
		addRoutes: aCollectionOfRoutes;
		yourself